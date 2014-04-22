all:
	case x$(OS) in \
	xWindows*) \
		case x$(shell uname) in \
		xCYGWIN*)\
			make $(if $(STATICPERLPREFIX),STATICPERL=$(STATICPERLPREFIX)/perl-cygwin-static,)         static;\
			make $(if $(STATICPERLPREFIX),STATICPERL=$(STATICPERLPREFIX)/perl-cygwin-dyn,   ) USEDL=y static;;\
		esac; \
		make $(if $(STATICPERLPREFIX),STATICPERL=$(STATICPERLPREFIX)/perl-win32-static,) FORCEOS=MINGW         static; \
		make $(if $(STATICPERLPREFIX),STATICPERL=$(STATICPERLPREFIX)/perl-win32-dyn,)    FORCEOS=MINGW USEDL=y static;; \
	*) \
		make $(if $(STATICPERLPREFIX),STATICPERL=$(STATICPERLPREFIX)/perl-static,)        static;\
		make $(if $(STATICPERLPREFIX),STATICPERL=$(STATICPERLPREFIX)/perl-dyn,)   USEDL=y static;;\
	esac

all-opt:
	make STATICPERLPREFIX=/opt all


ISOS?=$(shell uname)
TMP_PERL=tmp-perl$(if $(FORCEOS),$(FORCEOS),$(ISOS))$(if $(USEDL),-dyn,)
PREFIX=$(if $(STATICPERL),$(STATICPERL),$(CURDIR)/$(TMP_PERL))
static:
	echo "Prefix: $(PREFIX)"
	echo "Prefix: $(PREFIX)"
	mkdir -p $(PREFIX);
	cd $(PREFIX); rm -rf dmake; case $(FORCEOS)`uname` in 					\
          MINGW* ) 									\
		if [ ! -f strawberry-perl-5.18.2.2-64bit-portable.zip ]; then 		\
			wget http://strawberryperl.com/download/5.18.2.2/strawberry-perl-5.18.2.2-64bit-portable.zip; \
		fi; 									\
		mkdir -p strawberry; cd strawberry; unzip -n ../strawberry-perl-5.18.2.2-64bit-portable.zip; cd ..;			\
		rm -rf App-Staticperl-1.43* perl src; wget http://search.cpan.org/CPAN/authors/id/M/ML/MLEHMANN/App-Staticperl-1.43.tar.gz; tar xvf App-Staticperl-1.43.tar.gz; \
		cat $(CURDIR)/patches/app-staticperl-1.43.patch | patch -p1 -d App-Staticperl-1.43; \
		cd App-Staticperl-1.43/; perl -pi -e 's/\r\n/\n/g' *;  						\
		export PATH=/usr/bin:/mingw/bin:$$PATH; \
		$(if $(FORCEOS),export FORCEOS=$(FORCEOS);,) \
		STATICPERL=$(PREFIX) bash ./staticperl.sh fetch; 		\
		export PATH=$(PREFIX)/strawberry/c/bin:/usr/bin:/mingw/bin:$$PATH; \
		cd $(PREFIX)/src/perl-5.18.2/win32; $(if $(USEDL),cp makefile.dyn.mk makefile.mk;,) \
		sed -ri 's@--INST--@$(subst \,\\,$(shell cygpath -w $(PREFIX)))\\perl@' makefile.mk; \
		unset SHELL; cmd.exe /c dmake.exe; cmd.exe /c dmake.exe install; 	\
		;; \
	  Darwin*|CYGWIN*|Linux*) \
		rm -rf $(PREFIX)/*; \
		rm -rf App-Staticperl-1.43* perl src; wget http://search.cpan.org/CPAN/authors/id/M/ML/MLEHMANN/App-Staticperl-1.43.tar.gz; tar xvf App-Staticperl-1.43.tar.gz; \
		cat $(CURDIR)/patches/app-staticperl-1.43.patch | patch -p1 -d App-Staticperl-1.43; \
		cd  $(PREFIX)/App-Staticperl-1.43/; perl -pi -e 's/\r\n/\n/g' *;  					\
		export LDLOADLIBS="-lcrypt"; \
		export STATICPERL=$(PREFIX); $(if $(USEDL),export USEDL=$(USEDL);,)\
		bash ./staticperl.sh build; 	\
		bash ./staticperl.sh install; 	\
		;; \
	esac; 

# $(if $(findstring CYGWIN,$(shell uname)),cygstart,) 
#		export PATH=$(PREFIX)/strawberry/c/bin:/usr/bin:/mingw/bin:$$PATH; \
#		cd $(PREFIX)/src/perl-5.18.2/win32; $(if $(USEDL),cp makefile.dyn.mk makefile.mk;,) \
#		sed -ri 's@--INST--@$(subst \,\\,$(shell cygpath -w $(PREFIX)))\\perl@' makefile.mk; \
#+unset SHELL; cmd.exe /c dmake.exe; cmd.exe /c dmake.exe install; 	\

static-gen-diff:
	-cd tmp-perl; find App-Staticperl-1.43.new | grep ~\$$ |xargs rm $$1
	-cd tmp-perl; diff -Naur App-Staticperl-1.43.ori App-Staticperl-1.43.new > ../patches/app-staticperl-1.43.patch

diff:
	mkdir -p $(CURDIR)/tmp-perl/App-Staticperl-1.43.new/patches/mingw/perl-5.18.2
	mkdir -p $(CURDIR)/tmp-perl/App-Staticperl-1.43.new/patches/cygwin/perl-5.18.2
	-cd tmp-perl/src; find . | grep ~\$$ |xargs rm $$1; 
	-cd tmp-perl/src; \
	diff -Naur perl-5.18.2.ori perl-5.18.2 > $(CURDIR)/tmp-perl/App-Staticperl-1.43.new/patches/mingw/perl-5.18.2/perl.diff; \
	diff -Naur perl-5.18.2.ori/Configure perl-5.18.2/Configure > $(CURDIR)/tmp-perl/App-Staticperl-1.43.new/patches/cygwin/perl-5.18.2/Configure.diff; \
	diff -Naur perl-5.18.2.ori/ext/B/Makefile.PL perl-5.18.2/ext/B/Makefile.PL > $(CURDIR)/tmp-perl/App-Staticperl-1.43.new/patches/cygwin/perl-5.18.2/ext_B_Makefile.patch; \
	diff -Naur perl-5.18.2.ori/ext/POSIX/Makefile.PL perl-5.18.2/ext/POSIX/Makefile.PL > $(CURDIR)/tmp-perl/App-Staticperl-1.43.new/patches/cygwin/perl-5.18.2/ext_POSIX_Makefile.patch
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

