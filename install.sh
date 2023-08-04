#!/bin/bash

download() {
      case $1 in
      "all")
         downloadNexus
         downloadRpm
         downloadImage
         downloadKubez
          ;;
      "nexus")
         downloadNexus
         ;;
      "rpm")
          downloadRpm
          ;;
      "image")
          downloadImage
          ;;
      "kubez")
          downloadKubez
          ;;
      *)
          printDownloadHelp
          ;;
      esac
}


install() {
    echo "安装$1"
}

printHelp() {
    printf "[WARN] 请输入你要选择的操作.\n\n"
    echo "Available Commands:"
    printf "  %-25s\t %s\t \n" "download" "下载离线包"
    printf "  %-25s\t %s\t \n" "install" "安装离线包"

}


printDownloadHelp() {
    printf "[WARN] 请输入你要下载的离线包.\n\n"
    echo "Available Commands:"
    printf "  %-25s\t %s\t \n" "all" "下载所有离线包"
    printf "  %-25s\t %s\t \n" "nexus" "下载nexus"
    printf "  %-25s\t %s\t \n" "rpm" "下载rpm离线包"
    printf "  %-25s\t %s\t \n" "image" "下载镜像包"
    printf "  %-25s\t %s\t \n" "kubez" "下载kubez-ansible 离线包"
}


printInstallHelp() {
    printf "[WARN] 安装所有依赖.\n\n"
    echo "Available Commands:"
    printf "  %-25s\t %s\t \n" "nexus" "安装nexus"
    printf "  %-25s\t %s\t \n" "image" "上传镜像"
}


case $1 in
    "download")
        download $2
        ;;
    "install")
        install $2
        ;;
    *)
        printHelp
        ;;
esac
