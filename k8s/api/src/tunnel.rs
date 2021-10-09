use kube::CustomResource;
use schemars::JsonSchema;
use serde::{Deserialize, Serialize};

#[derive(CustomResource, Default, Deserialize, Serialize, Clone, Debug, JsonSchema)]
#[kube(
    group = "tunnel.kubeflare.dev",
    version = "v1alpha1",
    kind = "Tunnel",
    namespaced,
    status = "TunnelStatus",
    singular = "tunnel",
    plural = "tunnels",
    shortname = "t"
)]
#[serde(rename_all = "camelCase")]
pub struct Tunnel {}
