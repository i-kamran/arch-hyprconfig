fstEntry=""

while read -r fst uuid name; do
    label=$(lsblk --noheadings --raw -o LABEL "${name}")
    mount=$(lsblk --noheadings --raw -o MOUNTPOINT "${name}")

    # If the partition is mounted as root or home and has no label, generate a label
    if [[ -n "${mount}" && -z "${label}" ]]; then
        generated_label=$(basename "${mount}" | tr -cd '[:alnum:]')
        sudo e2label "${name}" "${generated_label}"
        label="${generated_label}"
    fi

    # If the partition is not mounted, has a label, and is not in fstab, create an entry and mount it
    if [[ -z "${mount}" && -n "${label}" && ! $(grep -q "${uuid}" /etc/fstab) ]]; then
        [ ! -d "/mnt/${label}" ] && sudo mkdir -p "/mnt/${label}"
        fstEntry="${fstEntry}\n# /${name}\nUUID=${uuid} /mnt/${label} ${fst} nosuid,nodev,nofail,x-gvfs-show 0 0\n"
        sudo mount "${name}" "/mnt/${label}"
    fi

done < <(lsblk --noheadings --raw -o TYPE,FSTYPE,UUID,NAME | awk '{if ($1=="part" && $2=="ext4") print $2, $3, "/dev/" $4}')

# Append the fstab entries and reload the systemd daemon if new entries were added
if [[ -n "${fstEntry}" ]]; then
    echo -e "${fstEntry}\n" | sudo tee -a /etc/fstab
    sudo systemctl daemon-reload
fi
