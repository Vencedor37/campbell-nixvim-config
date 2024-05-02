{ pkgs ? import <nixpkgs> {} }:

pkgs.stdenv.mkDerivation rec {
  pname = "phpunit";
  version = "9.5.10";  # Specify the version you need

  src = pkgs.fetchurl {
    url = "https://phar.phpunit.de/phpunit-${version}.phar";
    sha256 = "";  # Update the sha256 checksum
  };

  buildInputs = [ pkgs.makeWrapper ];

  installPhase = ''
    mkdir -p $out/bin
    cp $src $out/bin/phpunit
    chmod +x $out/bin/phpunit
    wrapProgram $out/bin/phpunit --prefix PATH : ${pkgs.php74}/bin
  '';

  meta = with pkgs.lib; {
    description = "PHPUnit is a programmer-oriented testing framework for PHP";
    homepage = "https://phpunit.de/";
    license = licenses.bsd3;
    platforms = platforms.all;
  };
}
