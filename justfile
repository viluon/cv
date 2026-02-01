default: show

show: build
	xdg-open rendercv_output/Ondřej_Kvapil_CV.pdf

build:
	rendercv render cv.yaml

check:
	nix flake check

format:
	nix fmt

watch:
	rendercv render --watch cv.yaml

clean:
	rm -rf rendercv_output
