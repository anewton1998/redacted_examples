# redacted_examples

This is a repository of JSON file containing examples of RDAP responses using the
RFC 9537 redaction extension.

The following describes the files.

example-1.net (example-1_net.json)
----------------------------------

This is basically Figure 12 from RFC 9537. It does the following redactions:

1. handle of the domain by removal.
1. name of the registrant by emptyValue
1. organization of the registrant by removal
1. street address of the registrant by emptyValue
1. city of registrant by emptyValue
1. postal code of registrant by emptyValue
1. email of registrant by removal
1. name of the technical contact by emptyValue
1. email of the technical contact by removal
1. phone of the technical contact by removal
1. fax of the technical contact by removal
1. the entire administrative contact by removal
1. the entire billing contact by removal

example-2.net (example-2_net.json)
----------------------------------

Same as example-1.net except all the dot notation is replaced with bracket notation.

example-3.net (example-3_net.json)
----------------------------------

Same as example-1.net except all emptyValue redactions are change to partialValue redactions.

example-4.net (example-4_net.json)
----------------------------------

For each top level entity (i.e. not the registrar abuse):
1. name  by emptyValue
1. organization by removal
1. street address by emptyValue
1. city by emptyValue
1. postal code by emptyValue
1. email by removal

example-5.net (example-5_net.json)
----------------------------------

For all entities recursively:
1. name  by emptyValue
1. organization by removal
1. street address by emptyValue
1. city by emptyValue
1. postal code by emptyValue
1. email by removal

example-6.net (example-6_net.json)
----------------------------------

Same structure as example-1.net. This file only has registrant redactions, which are
all referenced using a negative index (-2).
1. name of the registrant by emptyValue
1. organization of the registrant by removal
1. street address of the registrant by emptyValue
1. city of registrant by emptyValue
1. postal code of registrant by emptyValue
1. email of registrant by removal

example-7.net (example-7_net.json)
----------------------------------

In this file, the registrant, billing, and technical contacts have been merged into
one entity and the "registrant" is the first element in the roles array. 
The file only has the following registrant redactions:
1. name of the registrant by emptyValue
1. organization of the registrant by removal
1. street address of the registrant by emptyValue
1. city of registrant by emptyValue
1. postal code of registrant by emptyValue
1. email of registrant by removal

example-8.net (example-8_net.json)
----------------------------------

Same as example-7.net except "registrant" is the last role in the roles array.
