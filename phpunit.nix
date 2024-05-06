{ stdenv, mkDerivation, fetchurl, makeWrapper, unzip, lib, php }:

let
  pname = "phpunit";
  version = "9.5.28";
in
mkDerivation {
  inherit pname version;

  src = fetchurl {
    url = "https://phar.phpunit.de/phpunit-${version}.phar";
    hash = "sha256-2LK5ZGjAtmzussNF7RSSUkgIn+dst2x7WRq5mqBNMZo=";
  };

  dontUnpack = true;
  nativeBuildInputs = [ makeWrapper ];

  installPhase = ''
    runHook preInstall
    mkdir -p $out/bin
    install -D $src $out/libexec/phpunit/phpunit.phar
    makeWrapper ${php}/bin/php $out/bin/phpunit \
      --add-flags "$out/libexec/phpunit/phpunit.phar" \
      --prefix PATH : ${lib.makeBinPath [ unzip ]}
    runHook postInstall
  '';

  meta = with lib; {
    description = "PHPUnit is a programmer-oriented testing framework for PHP";
    homepage = "https://phpunit.de/";
    license = licenses.bsd3;
    platforms = platforms.all;
  };
}
