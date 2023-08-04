#！/bin/bash

# 镜像版本
IMAGETAG="1.23.17"

# 拉取的用户名和密码
USER="ptx9sk7vk7ow:003a1d6132741b195f332b815e8f98c39ecbcc1a"

# 拉取的URL
URL="https://pixiupkg-generic.pkg.coding.net"


downloadNexus() {
  # 准备 nexus 离线包
  curl -fL -u $USER $URL/pixiu/k8soffline/nexus.tar.gz?version=latest -o nexus.tar.gz
}

downloadRpm() {
  # 准备 rpm 离线包
  curl -fL -u $USER $URL/pixiu/k8soffline/k8s-v$IMAGETAG-rpm.tar.gz?version=latest -o k8s-v$IMAGETAG-rpm.tar.gz
}

downloadImage() {
  # 准备镜像离线包
  curl -fL -u $USER $URL/pixiu/allimagedownload/allimagedownload.tar.gz?version=latest -o k8s-centos7-v$IMAGETAG_images.tar.gz
}

downloadKubez() {
  # 准备 kubez-ansible 离线包
  curl https://codeload.github.com/gopixiu-io/kubez-ansible-offline/zip/refs/heads/master -o kubez-ansible-offline-master.zip
}


printHelp() {
    printf "[WARN] 请输入你要下载的离线包.\n\n"
    echo "Available Commands:"
    printf "  %-25s\t %s\t \n" "all" "下载所有离线包"
    printf "  %-25s\t %s\t \n" "nexus" "下载nexus"
    printf "  %-25s\t %s\t \n" "rpm" "下载rpm离线包"
    printf "  %-25s\t %s\t \n" "image" "下载镜像包"
    printf "  %-25s\t %s\t \n" "kubez" "下载kubez-ansible 离线包"
}




download() {
  case $2 in
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
          printHelp
          ;;
  esac
}






case $1 in
    "download")
        download
        ;;
    "install")
        install
        ;;
    *)
        printHelp
        ;;
esac
