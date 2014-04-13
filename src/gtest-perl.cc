#include <gtest/gtest-perl.h>

#define PERLDLL
#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

static void
xs_init(pTHX)
{
    char *file = __FILE__;
    dXSUB_SYS;
}

namespace testing {

	gtest_perl::gtest_perl() {
		int exitstatus, argc = 1;
		char *argv_[2] = {"test",0}, **argv  = argv_;
		char *embedding[] = { "", "-e", "0" };
		PERL_SYS_INIT(&argc,&argv);
		if (!(my_perl = perl_alloc()))
			return ;
		perl_construct(my_perl);
		PL_perl_destruct_level = 0;
		/* init PL_defstash */
		perl_parse(my_perl, NULL, 3, embedding, NULL);
		PL_exit_flags |= PERL_EXIT_DESTRUCT_END;
		perl_run(my_perl);
	}

	gtest_perl::~gtest_perl() {
		if (my_perl) {
			perl_destruct(my_perl);
			perl_free(my_perl);
		}
	}

	char *gtest_perl::evalToStr(char *str) {
		  eval_pv( str, TRUE);
		  return SvPV_nolen(get_sv("r", 0));
	}


}
