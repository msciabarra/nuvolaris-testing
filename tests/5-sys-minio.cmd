:: Licensed to the Apache Software Foundation (ASF) under one
:: or more contributor license agreements.  See the NOTICE file
:: distributed with this work for additional information
:: regarding copyright ownership.  The ASF licenses this file
:: to you under the Apache License, Version 2.0 (the
:: "License"); you may not use this file except in compliance
:: with the License.  You may obtain a copy of the License at
::
::   http://www.apache.org/licenses/LICENSE-2.0
::
:: Unless required by applicable law or agreed to in writing,
:: software distributed under the License is distributed on an
:: "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
:: KIND, either express or implied.  See the License for the
:: specific language governing permissions and limitations
:: under the License.

nuv config enable --minio
nuv update apply
nuv setup nuvolaris wait-cm JSONPATH="{.metadata.annotations.minio_bucket_data}"

nuv config status | find "NUVOLARIS_MINIO=true" > nul
if errorlevel 1 (
    echo SKIPPING
    exit /b 0
) else (
    nuv setup nuvolaris minio | find "nuvolaris-data" > nul
    if not errorlevel 1 (
        echo SUCCESS
        exit /b 0
    ) else (
        echo FAIL
        exit /b 1
    )
)
