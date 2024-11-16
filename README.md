# Adding Templating to a Kustomize Deployment

This is a demonstration repository to illustrate how we can create a post-render step in our Kustomize deployments that will allow us to add templating to our deployments.

## Build

### Environment

To deploy this example as easily as possible, here is how to build a suitable Minikube cluster for development purposes.

```bash
minikube start  # start a new minikube cluster
minikube enable addons ingress  # enable the ingress-nginx controller
minikube ip  # outputs the IP of your minikube cluster
```

Add the following line to your hosts file to access your minikube cluster from your browser, swapping <minikube-ip> for the IP output by the final command above.

Your hosts file location will differ depending on your operating system, I assume you know where to find it for your own system.

```
<minikube-ip>       local.minikube.com
```

> Note: if you are using minikube within a virtual environment (such as Windows Subsystem for Linux, or the iOS equivalent) there is an additional step required
>
> ```bash
> minikube tunnel
> ```
>
> This will start a tunnel to your virtual environment, and must be running in the background to access the minikube cluster. For WSL, because the tunnel is to WSL, you should use 127.0.0.1 as the <minikube-ip> in your (Windows) hosts file.

### Deployment

The following command will generate the manifests and push them to your cluster.

```bash
make deploy
```

If you just want to see the generated manifests you can do `make build` to see them output to stdout. Redirect to a file for easier inspection, i.e. `make build > k.yaml`.

## Usage

Two apps are deployed as part of this application, app1 and app2. They are very simple html files served by nginx containers. You can view their content at:

- local.minikube.com/app1
- local.minikube.com/app2
