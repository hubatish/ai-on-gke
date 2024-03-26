# Copyright 2023 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.


##common variables
## Need to pull this variables from tf output from previous platform stage
project_id = "<your project ID>"

## this is required for terraform to connect to GKE master and deploy workloads
create_cluster    = true # Create a GKE cluster in the specified network.
autopilot_cluster = true
private_cluster   = false
cluster_name      = "ml-cluster"
cluster_location  = "us-central1"
create_network    = true
network_name      = "ml-network"
subnetwork_cidr   = "10.100.0.0/16"

#######################################################
####    APPLICATIONS
#######################################################

## GKE environment variables
kubernetes_namespace = "ml"

# Creates a google service account & k8s service account & configures workload identity with appropriate permissions.
# Set to false & update the variable `workload_identity_service_account` to use an existing IAM service account.
create_service_account            = true
workload_identity_service_account = "ray-sa"

# Bucket name should be globally unique.
create_gcs_bucket               = true
gcs_bucket                      = "ray-bucket-zydg"
create_ray_cluster              = true
ray_cluster_name                = "ray-cluster"
enable_grafana_on_ray_dashboard = false

## IAP config - if you choose to disable IAP authenticated access for your endpoints, ignore everthing below this line.
create_brand  = false
support_email = "<email>" ## specify if create_brand=true

## Ray Dashboard IAP Settings
ray_dashboard_add_auth                 = false # Set to true when using auth with IAP
ray_dashboard_k8s_ingress_name         = "ray-dashboard-ingress"
ray_dashboard_k8s_managed_cert_name    = "ray-dashboard-managed-cert"
ray_dashboard_k8s_iap_secret_name      = "ray-dashboard-iap-secret"
ray_dashboard_k8s_backend_config_name  = "ray-dashboard-iap-config"
ray_dashboard_k8s_backend_service_port = 8265

ray_dashboard_domain            = ""
ray_dashboard_client_id         = ""
ray_dashboard_client_secret     = ""
ray_dashboard_members_allowlist = "user:<email>,group:<email>,serviceAccount:<email>,domain:google.com"
