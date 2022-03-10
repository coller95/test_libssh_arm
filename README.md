```console
source simple_setup.sh
```

```console
export LV_LIBSSH_PATH=$(pwd)
```

/////////////////////
build openssl
/////////////////////
```console
tar -xf cross_compile/openssl-1.1.0f.tar.gz --directory cross_compile
cd cross_compile/openssl-1.1.0f
./Configure linux-armv4 --prefix=$LV_LIBSSH_PATH/cross_compile/openssl-1.1.0f/build_arm
make -j8 CC=$CC AR="$AR r"
make -j8 install
cd $LV_LIBSSH_PATH
```


/////////////////////
build libssh
/////////////////////
```console
tar -xf cross_compile/libssh-0.9.6.tar.xz --directory cross_compile
mkdir cross_compile/libssh-0.9.6/build
cd cross_compile/libssh-0.9.6/build
cmake -DOPENSSL_ROOT_DIR=$LV_LIBSSH_PATH/cross_compile/openssl-1.1.0f/build_arm ..
make -j8
cd $LV_LIBSSH_PATH
```

/////////////////////
cp lib and include
/////////////////////
```console
mkdir lib include include/openssl include/libssh
cp -r cross_compile/openssl-1.1.0f/build_arm/lib/libcrypto.so lib/.
cp -r cross_compile/openssl-1.1.0f/build_arm/lib/libcrypto.so.1.1 lib/.
cp -r cross_compile/openssl-1.1.0f/build_arm/lib/libssl.so lib/.
cp -r cross_compile/openssl-1.1.0f/build_arm/lib/libssl.so.1.1 lib/.
cp -r cross_compile/openssl-1.1.0f/include/openssl/* include/openssl/.
cp -r cross_compile/libssh-0.9.6/build/lib/libssh.so lib/.
cp -r cross_compile/libssh-0.9.6/build/lib/libssh.so.4 lib/.
cp -r cross_compile/libssh-0.9.6/build/lib/libssh.so.4.8.7 lib/.
cp -r cross_compile/libssh-0.9.6/build/include/libssh/libssh_version.h include/libssh/.
cp -r cross_compile/libssh-0.9.6/include/libssh/* include/libssh/.
```

/////////////////////
build program
/////////////////////
```console
$CC main.cpp -L./lib -I./include -lcrypto -lssl -lssh
```