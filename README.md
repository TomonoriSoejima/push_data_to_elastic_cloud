# push_data_to_elastic_cloud

## Bash Scripts for Deployment and Data Transfer

  

This repository contains bash scripts useful for fetching deployment credentials and transferring data.

  

## 1\. Script Description

  

### `get_cred_endpoint.sh`

  

This script fetches the short deployment ID from a given input, extracts the associated credentials, and identifies the associated Elasticsearch endpoint for the deployment.

  

#### Usage:

  

```

./get_cred_endpoint.sh [DEPLOYMENT_ID]

  
```

  

Where:

  

-  `[DEPLOYMENT_ID]` is the ID of the deployment from which you want to extract credentials and endpoint.

  

#### Features:

  

- Extracts a short deployment ID from the given input.

- Searches for credentials associated with the short deployment ID.

- Retrieves the Elasticsearch endpoint for the deployment.

  

### `push_custom_data.sh`

  

This script uses the `get_cred_endpoint.sh` to get credentials and endpoint, and then transfers data from `data.json` to the specified Elasticsearch endpoint.

  

#### Usage:

  

```

./push_custom_data.sh [DEPLOYMENT_ID]

  
```

  

Where:

  

-  `[DEPLOYMENT_ID]` is the ID of the deployment to which you want to transfer data.

  

#### Features:

  

- Gets credentials and endpoint using `get_cred_endpoint.sh`.

- Transfers data from `data.json` to the Elasticsearch endpoint.

  

## 2\. Dependencies

  

These scripts rely on the following dependencies:

  

-  **[`jq`](https://stedolan.github.io/jq/)**: Lightweight and flexible command-line JSON processor.

- Installation via Homebrew:

-  **[`ecctl`](https://www.elastic.co/guide/en/ecctl/current/index.html)**: The Elastic Cloud Control (ecctl) command-line tool for interacting with Elasticsearch Service.

- macOS installation instructions can be found in the official [Elastic documentation](https://www.elastic.co/guide/en/ecctl/current/installation.html).

-  **[`kibana2json`](https://github.com/spinscale/kibana2json)**: A tool for converting Kibana dashboards to JSON and vice versa.

- You can follow the installation and usage instructions provided in its GitHub repository.

-  **[`http`](https://httpie.io/)**: A command-line HTTP client, part of [HTTPie](https://httpie.io/).

- Installation via Homebrew:

  

Before executing the scripts, ensure these dependencies are installed and available in your `PATH`.

  

## 3\. Notes

  

- Ensure both scripts are executable. You can use `chmod +x script_name.sh` to make them executable.

- Always ensure that the required dependencies are installed and available in your `PATH`.

- Make sure to place your `data.json` in the same directory as the scripts or modify the script to point to the correct path.

- You will need a password file stored in the same directory for authentication purposes. For more details on managing and resetting Elastic Cloud passwords, refer to the official [Elastic Cloud documentation](https://www.elastic.co/guide/en/cloud/current/ec-password-reset.html).
