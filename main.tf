provider "kubernetes" {
  config_path = "~/.kube/config"
}

resource "kubernetes_deployment" "hello_fn" {
  metadata {
    name      = "hello-fn"
    namespace = "openfaas-fn"
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "hello-fn"
      }
    }

    template {
      metadata {
        labels = {
          app = "hello-fn"
        }
      }

      spec {
        container {
          name  = "hello-fn"
          image = "your-docker-username/hello-fn:latest"
          port {
            container_port = 8080
          }
        }
      }
    }
  }
}
