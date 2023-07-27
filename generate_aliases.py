#!/usr/bin/python
# -*- coding: utf-8 -*-

# Copyright 2017 Google Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

from __future__ import print_function

import itertools

try:
    xrange  # Python 2
except NameError:
    xrange = range  # Python 3


def main():
    # (alias, full, allow_when_oneof, incompatible_with)
    cmds = [
        ("kv", "kubectl --context viking", None, None),
        ("kkf", "kubectl --context kubeflow --namespace kubeflow", None, None),
    ]

    globs = [
        ("p", "--namespace=prod", ["kv"], None),
        ("pach", "--namespace=pachyderm-v2", ["kv"], None),
        ("d", "--namespace=dev", ["kv"], None),
    ]

    ops = [
        ("lo", "logs -f", None, None),
        ("g", "get", None, None),
        ("d", "describe", None, None),
    ]

    res = [
        ("po", "pods", ["g", "d"], None),
        ("dep", "deployment", ["g", "d"], None),
        ("cj", "cronjob", ["g", "d"], None),
        ("rc", "replicationcontroller", ["g", "d"], None),
        ("svc", "service", ["g", "d"], None),
        ("no", "nodes", ["g", "d"], None),
    ]
    res_types = [r[0] for r in res]

    args = [
        ("oyaml", "-o=yaml", ["g"], ["owide", "ojson", "sl"]),
        ("ojson", "-o=json", ["g"], ["owide", "oyaml", "sl"]),
        ("all", "--all-namespaces", ["g", "d"], ["f", "no"]),
        (
            "sl",
            "--show-labels",
            ["g"],
            ["oyaml", "ojson"] + diff(res_types, ["po", "dep"]),
        ),
    ]

    # these accept a value, so they need to be at the end and
    # mutually exclusive within each other.
    positional_args = [
        ("l", "-l", ["g", "d"], ["f", "all"]),
        (
            "n",
            "--namespace",
            ["g", "d", "lo", "ex", "pf"],
            ["ns", "no", "all"],
        ),
    ]

    # [(part, optional, take_exactly_one)]
    parts = [
        (cmds, False, True),
        (globs, True, False),
        (ops, True, True),
        (res, True, True),
        (args, True, False),
        (positional_args, True, True),
    ]

    out = gen(parts)

    # prepare output
    for cmd in out:
        print(
            "alias {}='{}'".format(
                "".join([a[0] for a in cmd]), " ".join([a[1] for a in cmd])
            )
        )


def gen(parts):
    out = [()]
    for (items, optional, take_exactly_one) in parts:
        orig = list(out)
        combos = []

        if optional and take_exactly_one:
            combos = combos.append([])

        if take_exactly_one:
            combos = combinations(items, 1, include_0=optional)
        else:
            combos = combinations(items, len(items), include_0=optional)

        # permutate the combinations if optional (args are not positional)
        if optional:
            new_combos = []
            for c in combos:
                new_combos += list(itertools.permutations(c))
            combos = new_combos

        new_out = []
        for segment in combos:
            for stuff in orig:
                if is_valid(stuff + segment):
                    new_out.append(stuff + segment)
        out = new_out
    return out


def is_valid(cmd):
    for i in xrange(0, len(cmd)):

        # check at least one of requirements are in the cmd
        requirements = cmd[i][2]
        if requirements:
            found = False
            for r in requirements:
                for j in xrange(0, i):
                    if cmd[j][0] == r:
                        found = True
                        break
                if found:
                    break
            if not found:
                return False

        # check none of the incompatibilities are in the cmd
        incompatibilities = cmd[i][3]
        if incompatibilities:
            found = False
            for inc in incompatibilities:
                for j in xrange(0, i):
                    if cmd[j][0] == inc:
                        found = True
                        break
                if found:
                    break
            if found:
                return False

    return True


def combinations(a, n, include_0=True):
    l = []
    for j in xrange(0, n + 1):
        if not include_0 and j == 0:
            continue
        l += list(itertools.combinations(a, j))
    return l


def diff(a, b):
    return list(set(a) - set(b))


if __name__ == "__main__":
    main()
