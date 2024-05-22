# redacted_examples

This is a repository of JSON file containing examples of RDAP responses using the
RFC 9537 redaction extension. It's purpose is to provide examples for testing.

These files may be used in integrated test suites or with the
[ICANN RDAP Server](https://github.com/icann/icann-rdap/blob/main/icann-rdap-srv/README.md).

A Dockerfile is supplied for use with 
[ICANN RDAP Server](https://github.com/icann/icann-rdap/blob/main/icann-rdap-srv/README.md).
To use the Dockerfile:
```
docker buildx build --tag "rdap-srv" .
docker run --network host rdap-srv
```

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

example-9.net (example-8_net.json)
----------------------------------

This example is a domain with only a registrant entity. It has the following redaction:
1. email of the registrant by replacementValue

example-10.net (example-10_net.json)
------------------------------------

Same as example-9.net, however the registrant doesn't have an email address but a
contact-uri, and the redaction is a replacementValue of the registrant's email with
the contact-uri (from Figure 9 in RFC 9537).


example-11.net (example-11_net.json)
------------------------------------

This example is similar to example-9.net, except the email address is an empty string
and there are two overlapping redactions:
1. removal of the registrant's email (the entire JSON object).
1. redaction of the registrant's email address by emptyValue (the specific JSON string).


example-12.net (example-12_net.json)
------------------------------------

This is the same as example-1.net except all the redactions are illegal in that when
they should have a `postPath` they have a `prePath` and vice-versa.

example-13.net (example-13_net.json)
------------------------------------

This is the same as example-1.net but the registrant street, city, and postal code
are now in the unstructured address.

example-14.net (example-14_net.json)
------------------------------------

This is the same as example-1.net however the registrant now has a voice and fax,
each with an extension. It has the following four additional redactions:

1. Registrant Phone by removal
1. Registrant Phone Extension be removal
1. Registrant Fax by removal
1. Registrant Fax Extension by removal

The phone and phone extension redactions overlap, and the fax and fax extension redactions
overlap as well.

example-15.net (example-15_net.json)
------------------------------------

This is the same as example-14.net except the redactions have been changed from removal
to partial value.

example-16.net (example-16_net.json)
------------------------------------

This is the same as example-15.net the registrant and technical contact are the
same, and redactions have been changed so the JSONPath impacts both roles.
