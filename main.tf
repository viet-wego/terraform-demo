provider "google" {
  credentials = "${file("~/keys/main-project-editor-181227.json")}"
  project     = "main-project-181227"
  region      = "asia-southeast1"
}

resource "google_compute_instance" "example" {
  name         = "example"
  machine_type = "n1-standard-1"
  zone         = "asia-southeast1-b"

  boot_disk {
    initialize_params {
      image = "centos-cloud/centos-7"
    }
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral IP
    }
  }
}
