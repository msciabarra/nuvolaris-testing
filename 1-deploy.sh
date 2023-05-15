#!/bin/bash
# Licensed to the Apache Software Foundation (ASF) under one
# or more contributor license agreements.  See the NOTICE file
# distributed with this work for additional information
# regarding copyright ownership.  The ASF licenses this file
# to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance
# with the License.  You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License.
TYPE="${1:?test type}"
TYPE="$(echo $TYPE | awk -F- '{print $1}')"
EMAIL=msciabarra@apache.org
nuv config reset

# actual setup
case "$TYPE" in
    (kind) 
        nuv config enable --redis --mongodb --minio
        nuv setup devcluster
    ;;
    (mk8s)
        nuv config enable --redis --mongodb --minio
        #nuv config apihost mk8s-nuv-test2.duckdns.org
        #nuv config tls $EMAIL
        nuv setup cluster microk8s
    ;;
    (k3s)
        # looks like there is some caching aroung and confuses k3sup
        nuv config enable --redis --mongodb --minio
        #nuv config tls $EMAIL
        nuv setup server k3s-nuv-test2.duckdns.org ubuntu
    ;;
esac
