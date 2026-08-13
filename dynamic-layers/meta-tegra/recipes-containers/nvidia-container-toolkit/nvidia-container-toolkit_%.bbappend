# nvidia-docker (removed upstream in meta-tegra ff3e10306b8a) used to ship its
# own /etc/docker/daemon.json registering the "nvidia" runtime. Nothing
# replaced that wiring: nvidia-container-setup.service only generates the
# runtime's own config under /run/nvidia-container-runtime/, it never tells
# dockerd about the runtime. Register it here without making it the default.
do_install:append() {
    sed -i '/^ExecStart=/a ExecStartPost=${bindir}/nvidia-ctk runtime configure --runtime=docker' \
        ${D}${systemd_system_unitdir}/nvidia-container-setup.service
}
