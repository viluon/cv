default: show

show: build
	xdg-open rendercv_output/Ondřej_Kvapil_CV.pdf

build:
	rendercv render cv.yaml

check: build
	nix flake check
	lychee \
		--cache \
		--method get \
		--exclude '^https://intel\.com\b' \
		--exclude '^https://linkedin\.com\b' \
		--exclude '^https://viluon\.me\b' \
		--user-agent "Mozilla/5.0 (X11; Linux x86_64; rv:10.0) Gecko/20100101 Firefox/128.0" \
		rendercv_output/*.md

format:
	nix fmt

watch:
	rendercv render --watch cv.yaml

clean:
	rm -rf rendercv_output
