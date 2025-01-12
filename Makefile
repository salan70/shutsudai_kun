#  ** dart, flutter 汎用 **

.PHONY: clean
clean:
	cd packages/app && fvm flutter clean

.PHONY: format_all
format_all:
	cd packages/app && fvm dart format .
	cd packages/common && fvm dart format .
	cd packages/data && fvm dart format .
	cd packages/dependency_provider && fvm dart format .
	cd packages/domain && fvm dart format .

.PHONY: pub_get
pub_get:
	fvm dart pub get

.PHONY: clean_pub_get
clean_pub_get:
	make clean
	make pub_get

.PHONY: test_app
test_app:
	cd packages/app && fvm flutter test

.PHONY: test_common
test_common:
	cd packages/common && fvm flutter test

.PHONY: test_data
test_data:
	cd packages/data && fvm flutter test

.PHONY: test_dependency_provider
test_dependency_provider:
	cd packages/dependency_provider && fvm flutter test

.PHONY: test_domain
test_domain:
	cd packages/domain && fvm flutter test

.PHONY: test_all
test_all:
	make test_app
	make test_common
	make test_data
	make test_dependency_provider
	make test_domain

# ** コード生成 **
.PHONY: gen_app
gen_app:
	cd packages/app && fvm dart run build_runner build --delete-conflicting-outputs

.PHONY: gen_common
gen_common:
	cd packages/common && fvm dart run build_runner build --delete-conflicting-outputs

.PHONY: gen_data
gen_data:
	cd packages/data && fvm dart run build_runner build --delete-conflicting-outputs

.PHONY: gen_dependency_provider
gen_dependency_provider:
	cd packages/dependency_provider && fvm dart run build_runner build --delete-conflicting-outputs

.PHONY: gen_domain
gen_domain:
	cd packages/domain && fvm dart run build_runner build --delete-conflicting-outputs

.PHONY: gen_all
gen_all:
	make gen_app
	make gen_common
	make gen_data
	make gen_dependency_provider
	make gen_domain

.PHONY: clean_gen_all
clean_gen_all:
	make clean
	make gen_all

# ** アセット生成 **
.PHONY: gen_splash
gen_splash:
	cd packages/app && fvm dart run flutter_native_splash:create

.PHONY: gen_icons
gen_icons:
	cd packages/app && fvm dart run flutter_launcher_icons

.PHONY: gen_all_assets
gen_all_assets:
	make gen_splash
	make gen_icons
