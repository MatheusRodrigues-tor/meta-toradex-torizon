# Since meta-tegra 5b05bbff38 the base recipe's do_deploy (devicetree.bbclass)
# only installs to ${DEPLOYDIR}/devicetree/, but ostree-kernel-initramfs
# (meta-updater) expects the dtb flat under DEPLOY_DIR_IMAGE. Mirror it there.
do_deploy:append() {
    for dtb in ${KERNEL_DEVICETREE}; do
        dtbf=$(basename "$dtb")
        install -m 0644 "${DEPLOYDIR}/devicetree/$dtbf" "${DEPLOYDIR}/$dtbf"
    done
}
