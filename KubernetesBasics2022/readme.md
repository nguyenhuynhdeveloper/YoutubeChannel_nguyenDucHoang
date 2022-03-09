minikube version
You now have a running Kubernetes cluster
minikube start
kubectl version
kubectl cluster-info
To view the nodes in the cluster:
kubectl get nodes
Deploy your first app:
kubectl create deployment kubernetes-bootcamp --image=gcr.io/google-samples/kubernetes-bootcamp:v1
I find a suitable node,where an instance of the application could be run,
To list your deployments:
kubectl get deployments
Pods that are running inside Kubernetes are running on a private, isolated network
We will open a second terminal window to run the proxy( forward communications into the cluster-wide)
Open second terminal tab:
kubectl proxy
We now have a connection between our host (terminal) and the Kubernetes cluster
Let's open http://localhost:8001/version
export POD_NAME=$(kubectl get pods -o go-template --template '{{range .items}}{{.metadata.name}}{{"\n"}}{{end}}')
echo Name of the Pod: $POD_NAME
Access the POD:
http://localhost:8001/api/v1/namespaces/default/pods/$POD_NAME
A Pod is a Kubernetes abstraction that represents a group of one or more application containers (such as Docker)
Pods are the atomic unit on the Kubernetes platform
each pod has an ip address
A Pod always runs on a Node
Each Node is managed by the control plane
A Node can have multiple pods
Kubelet, a process responsible for communication between the Kubernetes control plane and the Node
kubectl get pods
To view what containers are inside that Pod and what images are used to build those containers
kubectl describe pods
Show logs for the container within the Pod:
kubectl logs $POD_NAME
Executing command on the container:
kubectl exec $POD_NAME -- env
start a bash session in the Pod’s container:
kubectl exec -ti $POD_NAME -- bash
cat server.js
Check that the application is up by running a curl command:
https://kubernetes.io/docs/tutorials/kubernetes-basics/expose/expose-intro/











