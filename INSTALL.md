# Docker 安裝 MySQL 指南

## 參考網址
- https://hub.docker.com/_/mysql
- https://ithelp.ithome.com.tw/m/articles/10272193

## 安裝步驟
1. 拉取最新 mysql 映像
   ```bash
   docker pull mysql
2. 檢查映像檔
  ```bash
     docker images
3. 運作 container
  ```bash
     docker run --name {container_name} -p 3306:3306 -e MYSQL_ROOT_PASSWORD={password} -d mysql
4. 進入 container
  ```bash
     docker exec -it mtsqlz bash
5. 登入 mysql
  ```bash
     mysql -u root -p
