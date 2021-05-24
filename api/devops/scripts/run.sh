SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
    DIR="$(cd -P "$(dirname "$SOURCE")" >/dev/null 2>&1 && pwd)"
    SOURCE="$(readlink "$SOURCE")"
    [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DIR="$(cd -P "$(dirname "$SOURCE")" >/dev/null 2>&1 && pwd)"

if [ -z $(lsb_release -d | egrep -i "ubuntu|mint|debian") ]; then
    sudo yum install -y jq postgresql-libs jq gcc postgresql-devel
    if [ -z "$(type -a redis-cli)" ]; then
        wget http://download.redis.io/redis-stable.tar.gz && tar xvzf redis-stable.tar.gz
        cd redis-stable && make
        sudo cp src/redis-cli /usr/local/bin/ && sudo chmod 755 /usr/local/bin/redis-cli
    fi
else
    sudo apt install -y postgresql-client-common jq redis-tools postgresql-client
fi
