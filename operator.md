# Operator Guide

This guide provides instructions for operators on deploying and managing the k8s-token bundle. This bundle is designed to deploy into a Kubernetes cluster, creating the necessary resources to manage namespace-specific access through a token. For more information on Kubernetes RBAC, check the [Kubernetes docs](https://kubernetes.io/docs/reference/access-authn-authz/rbac/).

## Overview

The k8s-token bundle automates the creation of the following Kubernetes resources in the specified namespace:

* `Role`: Defines the permissions for the token.
* `RoleBinding`: Binds the Role to a ServiceAccount.
* `ServiceAccount`: Provides the identity for the token.
* `Secret`: Stores the token securely.

This will result in a long-lived bearer token with the specified permissions. This token is available for download in `kubeconfig` format (see the [Massdriver docs](https://docs.massdriver.cloud/runbooks/kubernetes/access) for more info), which provides an easy path for granting narrowly scoped permissions to a Kubernetes Cluster to other engineers. Additionally, it can be used within Massdriver as a [remote reference](https://docs.massdriver.cloud/guides/sharing-infrastructure#using-remote-references) to narrow the scope of permissions of a Kubernetes cluster.

## Maintenance and Troubleshooting

### Viewing Resources

To verify that resources were created correctly, run the following commands in the Kubernetes cluster:

```bash
kubectl get role,rolebinding,serviceaccount,secret -n <namespace>
```

### Rotating the Token

If the token needs to be rotated:

1. Decommission the bundle in Massdriver
2. Redeploy the bundle in Massdriver.

### Updating Permissions

To update the permissions for the token:

1. Modify the Role definition in the bundle configuration.
2. Redeploy the bundle.

### Deletion

To remove the resources created by this bundle:

1. Decommission the bundle in Massdriver