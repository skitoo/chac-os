#!/bin/bash


current_dir=`pwd`
build_dir="${current_dir}/build"
target_dir="${build_dir}/os/chac"
noobs_dir="${current_dir}/noobs"
buildroot_dir="${current_dir}/buildroot"
configs_dir="${current_dir}/configs"



echo -e "Launch Chac build..."

rm -rf $build_dir
cp -r $noobs_dir $build_dir
mkdir $target_dir


echo -e "Create SD content.."
cp "$buildroot_dir/output/images/rootfs.tar" "${target_dir}/root.tar"
xz "${target_dir}/root.tar"

tar -cvf "${target_dir}/boot.tar" -C "${buildroot_dir}/output/images/rpi-firmware/" "../zImage" `ls ${buildroot_dir}/output/images/rpi-firmware/`
xz "${target_dir}/boot.tar"

tar -cvf "${target_dir}/data.tar" -C "${buildroot_dir}/board/chac/data/" `ls ${buildroot_dir}/board/chac/data/`
xz "${target_dir}/data.tar"

cp -r "$configs_dir/." "$target_dir/"

echo -e "Chac build with success! Copy all files in 'build' folder on your your SD card."
