# Copyright 2020 The Bazel Authors. All rights reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
load("@bazel_jar_jar//:jar_jar.bzl", _jar_jar = "jar_jar")

def jarjar_action(actions, rules, input, output, jarjar):
    actions.run(
        inputs = [rules, input],
        outputs = [output],
        executable = jarjar,
        progress_message = "jarjar %%{label}",
        arguments = ["process", rules.path, input.path, output.path],
    )
    return output


def jar_jar(name, output_jar = None, **kwargs):
    _jar_jar(
        name = name,
        output_jar = output_jar or (name + ".jar"),
        **kwargs
    )
