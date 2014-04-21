all: static

OS?=$(shell uname)
TMP_PERL=tmp-perl$(OS)
static:
	mkdir -p $(TMP_PERL);
	cd $(TMP_PERL); rm -rf dmake; case `uname` in 					\
          MINGW* ) 									\
		wget http://search.cpan.org/CPAN/authors/id/S/SH/SHAY/dmake-4.12.2.2.zip; unzip dmake-4.12.2.2.zip;\
		if [ ! -f strawberry-perl-5.18.2.2-64bit-portable.zip ]; then 		\
			wget http://strawberryperl.com/download/5.18.2.2/strawberry-perl-5.18.2.2-64bit-portable.zip; \
		fi; 									\
		unzip -f strawberry-perl-5.18.2.2-64bit-portable.zip;			\
		export PATH=$(CURDIR)/$(TMP_PERL)/c/bin:$$PATH; 			\
		rm -rf App-Staticperl-1.43 perl src; wget http://search.cpan.org/CPAN/authors/id/M/ML/MLEHMANN/App-Staticperl-1.43.tar.gz; tar xvf App-Staticperl-1.43.tar.gz; \
		cat $(CURDIR)/patches/app-staticperl-1.43.patch | patch -p1 -d App-Staticperl-1.43; \
		cd App-Staticperl-1.43/;  						\
		export PATH=$(CURDIR)/$(TMP_PERL)/c/bin:$(CURDIR)/$(TMP_PERL)/dmake:/usr/bin:/mingw/bin:$$PATH; \
		STATICPERL=$(CURDIR)/$(TMP_PERL) bash ./staticperl.sh fetch; 		\
		cd $(CURDIR)/$(TMP_PERL)/src/perl-5.18.2/win32; cmd.exe /c dmake; 	\
		;; \
	  Darwin*|CYGWIN*|Linux*) \
		rm -rf $(CURDIR)/$(TMP_PERL)/*; \
		rm -rf App-Staticperl-1.43 perl src; wget http://search.cpan.org/CPAN/authors/id/M/ML/MLEHMANN/App-Staticperl-1.43.tar.gz; tar xvf App-Staticperl-1.43.tar.gz; \
		cat $(CURDIR)/patches/app-staticperl-1.43.patch | patch -p1 -d App-Staticperl-1.43; \
		cd  $(CURDIR)/$(TMP_PERL)/App-Staticperl-1.43/;  					\
		export STATICPERL=$(CURDIR)/$(TMP_PERL); \
		bash ./staticperl.sh build; 	\
		bash ./staticperl.sh install; 	\
		;; \
	esac; 


static-gen-diff:
	-cd tmp-perl; find App-Staticperl-1.43.new | grep ~\$$ |xargs rm $$1
	-cd tmp-perl; diff -Naur App-Staticperl-1.43.ori App-Staticperl-1.43.new > ../patches/app-staticperl-1.43.patch

diff:
	mkdir -p $(CURDIR)/tmp-perl/App-Staticperl-1.43.new/patches/mingw/perl-5.18.2
	mkdir -p $(CURDIR)/tmp-perl/App-Staticperl-1.43.new/patches/cygwin/perl-5.18.2
	-cd tmp-perl/src; find . | grep ~\$$ |xargs rm $$1; 
	-cd tmp-perl/src; \
	diff -Naur perl-5.18.2.ori perl-5.18.2 > $(CURDIR)/tmp-perl/App-Staticperl-1.43.new/patches/mingw/perl-5.18.2/perl.diff; \
	diff -Naur perl-5.18.2.ori/Configure perl-5.18.2/Configure > $(CURDIR)/tmp-perl/App-Staticperl-1.43.new/patches/cygwin/perl-5.18.2/Configure.diff
	make static-gen-diff

straw:
	wget http://strawberryperl.com/download/5.18.2.2/strawberry-perl-5.18.2.2-64bit.zip

raw:
	mkdir -p tmp-perl;
	cd tmp-perl; \
	wget https://raw.github.com/arsv/perl-cross/releases/perl-5.18.2-cross-0.8.5.tar.gz

ext:
	perl -MExtUtils::Embed -e xsinit -- -o xsinit.c Socket
	perl -MExtUtils::Embed -e ldopts -- -std Msql -- -L/usr/msql/lib -lmsql
	perl -MExtUtils::Embed -e perl_inc

