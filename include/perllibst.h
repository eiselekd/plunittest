/*DO NOT EDIT
  this file is included from perllib.c to init static extensions */
#ifdef STATIC1
    "B",
    "Compress/Raw/Bzip2",
    "Compress/Raw/Zlib",
    "Cwd",
    "Data/Dumper",
    "Devel/PPPort",
    "Devel/Peek",
    "Digest/MD5",
    "Digest/SHA",
    "Fcntl",
    "File/DosGlob",
    "File/Glob",
    "Filter/Util/Call",
    "Hash/Util",
    "Hash/Util/FieldHash",
    "IO",
    "List/Util",
    "MIME/Base64",
    "Math/BigInt/FastCalc",
    "Opcode",
    "POSIX",
    "PerlIO/encoding",
    "PerlIO/mmap",
    "PerlIO/scalar",
    "PerlIO/via",
    "Socket",
    "Storable",
    "Sys/Hostname",
    "Text/Soundex",
    "Tie/Hash/NamedCapture",
    "Time/HiRes",
    "Time/Piece",
    "Unicode/Collate",
    "Unicode/Normalize",
    "Win32API/File",
    "Win32CORE",
    "XS/APItest",
    "XS/Typemap",
    "arybase",
    "attributes",
    "mro",
    "re",
    "threads",
    "threads/shared",
#undef STATIC1
#endif
#ifdef STATIC2
    EXTERN_C void boot_B (pTHX_ CV* cv);
    EXTERN_C void boot_Compress__Raw__Bzip2 (pTHX_ CV* cv);
    EXTERN_C void boot_Compress__Raw__Zlib (pTHX_ CV* cv);
    EXTERN_C void boot_Cwd (pTHX_ CV* cv);
    EXTERN_C void boot_Data__Dumper (pTHX_ CV* cv);
    EXTERN_C void boot_Devel__PPPort (pTHX_ CV* cv);
    EXTERN_C void boot_Devel__Peek (pTHX_ CV* cv);
    EXTERN_C void boot_Digest__MD5 (pTHX_ CV* cv);
    EXTERN_C void boot_Digest__SHA (pTHX_ CV* cv);
    EXTERN_C void boot_Fcntl (pTHX_ CV* cv);
    EXTERN_C void boot_File__DosGlob (pTHX_ CV* cv);
    EXTERN_C void boot_File__Glob (pTHX_ CV* cv);
    EXTERN_C void boot_Filter__Util__Call (pTHX_ CV* cv);
    EXTERN_C void boot_Hash__Util (pTHX_ CV* cv);
    EXTERN_C void boot_Hash__Util__FieldHash (pTHX_ CV* cv);
    EXTERN_C void boot_IO (pTHX_ CV* cv);
    EXTERN_C void boot_List__Util (pTHX_ CV* cv);
    EXTERN_C void boot_MIME__Base64 (pTHX_ CV* cv);
    EXTERN_C void boot_Math__BigInt__FastCalc (pTHX_ CV* cv);
    EXTERN_C void boot_Opcode (pTHX_ CV* cv);
    EXTERN_C void boot_POSIX (pTHX_ CV* cv);
    EXTERN_C void boot_PerlIO__encoding (pTHX_ CV* cv);
    EXTERN_C void boot_PerlIO__mmap (pTHX_ CV* cv);
    EXTERN_C void boot_PerlIO__scalar (pTHX_ CV* cv);
    EXTERN_C void boot_PerlIO__via (pTHX_ CV* cv);
    EXTERN_C void boot_Socket (pTHX_ CV* cv);
    EXTERN_C void boot_Storable (pTHX_ CV* cv);
    EXTERN_C void boot_Sys__Hostname (pTHX_ CV* cv);
    EXTERN_C void boot_Text__Soundex (pTHX_ CV* cv);
    EXTERN_C void boot_Tie__Hash__NamedCapture (pTHX_ CV* cv);
    EXTERN_C void boot_Time__HiRes (pTHX_ CV* cv);
    EXTERN_C void boot_Time__Piece (pTHX_ CV* cv);
    EXTERN_C void boot_Unicode__Collate (pTHX_ CV* cv);
    EXTERN_C void boot_Unicode__Normalize (pTHX_ CV* cv);
    EXTERN_C void boot_Win32API__File (pTHX_ CV* cv);
    EXTERN_C void boot_Win32CORE (pTHX_ CV* cv);
    EXTERN_C void boot_XS__APItest (pTHX_ CV* cv);
    EXTERN_C void boot_XS__Typemap (pTHX_ CV* cv);
    EXTERN_C void boot_arybase (pTHX_ CV* cv);
    EXTERN_C void boot_attributes (pTHX_ CV* cv);
    EXTERN_C void boot_mro (pTHX_ CV* cv);
    EXTERN_C void boot_re (pTHX_ CV* cv);
    EXTERN_C void boot_threads (pTHX_ CV* cv);
    EXTERN_C void boot_threads__shared (pTHX_ CV* cv);
#undef STATIC2
#endif
#ifdef STATIC3
    newXS("B::bootstrap", boot_B, file);
    newXS("Compress::Raw::Bzip2::bootstrap", boot_Compress__Raw__Bzip2, file);
    newXS("Compress::Raw::Zlib::bootstrap", boot_Compress__Raw__Zlib, file);
    newXS("Cwd::bootstrap", boot_Cwd, file);
    newXS("Data::Dumper::bootstrap", boot_Data__Dumper, file);
    newXS("Devel::PPPort::bootstrap", boot_Devel__PPPort, file);
    newXS("Devel::Peek::bootstrap", boot_Devel__Peek, file);
    newXS("Digest::MD5::bootstrap", boot_Digest__MD5, file);
    newXS("Digest::SHA::bootstrap", boot_Digest__SHA, file);
    newXS("Fcntl::bootstrap", boot_Fcntl, file);
    newXS("File::DosGlob::bootstrap", boot_File__DosGlob, file);
    newXS("File::Glob::bootstrap", boot_File__Glob, file);
    newXS("Filter::Util::Call::bootstrap", boot_Filter__Util__Call, file);
    newXS("Hash::Util::bootstrap", boot_Hash__Util, file);
    newXS("Hash::Util::FieldHash::bootstrap", boot_Hash__Util__FieldHash, file);
    newXS("IO::bootstrap", boot_IO, file);
    newXS("List::Util::bootstrap", boot_List__Util, file);
    newXS("MIME::Base64::bootstrap", boot_MIME__Base64, file);
    newXS("Math::BigInt::FastCalc::bootstrap", boot_Math__BigInt__FastCalc, file);
    newXS("Opcode::bootstrap", boot_Opcode, file);
    newXS("POSIX::bootstrap", boot_POSIX, file);
    newXS("PerlIO::encoding::bootstrap", boot_PerlIO__encoding, file);
    newXS("PerlIO::mmap::bootstrap", boot_PerlIO__mmap, file);
    newXS("PerlIO::scalar::bootstrap", boot_PerlIO__scalar, file);
    newXS("PerlIO::via::bootstrap", boot_PerlIO__via, file);
    newXS("Socket::bootstrap", boot_Socket, file);
    newXS("Storable::bootstrap", boot_Storable, file);
    newXS("Sys::Hostname::bootstrap", boot_Sys__Hostname, file);
    newXS("Text::Soundex::bootstrap", boot_Text__Soundex, file);
    newXS("Tie::Hash::NamedCapture::bootstrap", boot_Tie__Hash__NamedCapture, file);
    newXS("Time::HiRes::bootstrap", boot_Time__HiRes, file);
    newXS("Time::Piece::bootstrap", boot_Time__Piece, file);
    newXS("Unicode::Collate::bootstrap", boot_Unicode__Collate, file);
    newXS("Unicode::Normalize::bootstrap", boot_Unicode__Normalize, file);
    newXS("Win32API::File::bootstrap", boot_Win32API__File, file);
    newXS("Win32CORE::bootstrap", boot_Win32CORE, file);
    newXS("XS::APItest::bootstrap", boot_XS__APItest, file);
    newXS("XS::Typemap::bootstrap", boot_XS__Typemap, file);
    newXS("arybase::bootstrap", boot_arybase, file);
    newXS("attributes::bootstrap", boot_attributes, file);
    newXS("mro::bootstrap", boot_mro, file);
    newXS("re::bootstrap", boot_re, file);
    newXS("threads::bootstrap", boot_threads, file);
    newXS("threads::shared::bootstrap", boot_threads__shared, file);
#undef STATIC3
#endif
