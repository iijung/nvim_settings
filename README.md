# AstroNvim install

## Install
```sh
bash ./install.sh
```

## Configuration
- `:PackerClean` : 비활성화되거나 사용하지 않는 플러그인 제거
- `:PackerSync` : 플러그인 업데이트 및 정리
- `:AstroUpdate` : 최신 버전 업데이트
```sh
cp -r ~/.config/nvim/lua/user_example/ ~/.config/nvim/lua/user/

# fix astronvim 2.0 error
sed -i '' 's/branch = \"main\"/branch = \"nightly\"/' ~/.config/nvim/lua/user/init.lua
nvim +AstroUpdate
nvim +PackerSync
```

## How To Use
```sh
nvim
```


## Reference
- [AstroNvim](https://astronvim.github.io/)
- https://github.com/ElApostles/Astrovim\_settings
- https://github.com/veggie-garden/42\_reset\_sh
