use anyhow::{Context, Result};

async fn main() -> Result<()> {
    let client = kube::Client::try_default()
        .await
        .context("failed to initialize kubernetes cluster");
}
