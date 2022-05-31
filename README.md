Scripts for installing router7: https://router7.org/installation
Prerequisites: go, libusb-1.0 (see below, steps also commented into `./00-rtr7-setup.sh`)
- Run `./00-rtr7-setup.sh`
- Run `./01-rtr7-install.sh`

---

New Go users should install Go:
Official Steps: https://go.dev/doc/install
Fedora Silverblue: `rpm-ostree install go`
Path Setup [system-wide]: 
  `echo $'#!/usr/bin/env bash\nexport PATH=$PATH:$(go env GOPATH)/bin' | sudo tee -a /etc/profile.d/gopath.sh > /dev/null`
Path Setup [user]:
  `echo 'export PATH=$PATH:$(go env GOPATH)/bin' >> $HOME/.profile`

---

Package 'libusb-1.0', required by 'virtual:world'
Fedora Silverblue: `rpm-ostree install libusb libusbx-devel`

---

Wireguard Issues
  go: github.com/rtr7/router7@v0.0.0-20220422150428-2ee2a943a7f3 requires
  golang.zx2c4.com/wireguard@v0.0.20201118: reading golang.zx2c4.com/wireguard/go.mod at revision v0.0.20201118: unknown revision v0.0.20201118

This may be related to version tags (with/without 'v'):
   https://groups.google.com/g/golang-nuts/c/MVtHZUtZru4?pli=1

Proxy Fix [system-wide]: 
  `echo $'#!/usr/bin/env bash\nexport GOPROXY=https://proxy.golang.org' | sudo tee -a /etc/profile.d/goproxy.sh > /dev/null`
Proxy Fix [user]:
  `echo 'export GOPROXY=https://proxy.golang.org' >> $HOME/.profile`
Proxy Fix [onetime]:
  `export GOPROXY=https://proxy.golang.org`

---

Ensure you open a new shell after any commented changes above, if Silverblue then reboot.
