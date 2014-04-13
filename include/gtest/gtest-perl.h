#ifndef GTEST_PERL_H
#define GTEST_PERL_H

#define PERLDLL
#include "EXTERN.h"
#include "perl.h"

namespace testing {

	class gtest_perl {
	public:
		gtest_perl();
		~gtest_perl();
		char *evalToStr(char *str);
		PerlInterpreter *my_perl;
	};
}

#endif

