
�/
google/protobuf/timestamp.protogoogle.protobuf";
	Timestamp
seconds (Rseconds
nanos (RnanosB~
com.google.protobufBTimestampProtoPZ+github.com/golang/protobuf/ptypes/timestamp��GPB�Google.Protobuf.WellKnownTypesJ�-
 �
�
 2� Protocol Buffers - Google's data interchange format
 Copyright 2008 Google Inc.  All rights reserved.
 https://developers.google.com/protocol-buffers/

 Redistribution and use in source and binary forms, with or without
 modification, are permitted provided that the following conditions are
 met:

     * Redistributions of source code must retain the above copyright
 notice, this list of conditions and the following disclaimer.
     * Redistributions in binary form must reproduce the above
 copyright notice, this list of conditions and the following disclaimer
 in the documentation and/or other materials provided with the
 distribution.
     * Neither the name of Google Inc. nor the names of its
 contributors may be used to endorse or promote products derived from
 this software without specific prior written permission.

 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
 A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
 OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
 SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
 LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.


  

" ;
	
%" ;

# 
	
# 

$ B
	
$ B

% ,
	
% ,

& /
	
& /

' "
	

' "

( !
	
$( !
�
 ~ �� A Timestamp represents a point in time independent of any time zone or local
 calendar, encoded as a count of seconds and fractions of seconds at
 nanosecond resolution. The count is relative to an epoch at UTC midnight on
 January 1, 1970, in the proleptic Gregorian calendar which extends the
 Gregorian calendar backwards to year one.

 All minutes are 60 seconds long. Leap seconds are "smeared" so that no leap
 second table is needed for interpretation, using a [24-hour linear
 smear](https://developers.google.com/time/smear).

 The range is from 0001-01-01T00:00:00Z to 9999-12-31T23:59:59.999999999Z. By
 restricting to that range, we ensure that we can convert to and from [RFC
 3339](https://www.ietf.org/rfc/rfc3339.txt) date strings.

 # Examples

 Example 1: Compute Timestamp from POSIX `time()`.

     Timestamp timestamp;
     timestamp.set_seconds(time(NULL));
     timestamp.set_nanos(0);

 Example 2: Compute Timestamp from POSIX `gettimeofday()`.

     struct timeval tv;
     gettimeofday(&tv, NULL);

     Timestamp timestamp;
     timestamp.set_seconds(tv.tv_sec);
     timestamp.set_nanos(tv.tv_usec * 1000);

 Example 3: Compute Timestamp from Win32 `GetSystemTimeAsFileTime()`.

     FILETIME ft;
     GetSystemTimeAsFileTime(&ft);
     UINT64 ticks = (((UINT64)ft.dwHighDateTime) << 32) | ft.dwLowDateTime;

     // A Windows tick is 100 nanoseconds. Windows epoch 1601-01-01T00:00:00Z
     // is 11644473600 seconds before Unix epoch 1970-01-01T00:00:00Z.
     Timestamp timestamp;
     timestamp.set_seconds((INT64) ((ticks / 10000000) - 11644473600LL));
     timestamp.set_nanos((INT32) ((ticks % 10000000) * 100));

 Example 4: Compute Timestamp from Java `System.currentTimeMillis()`.

     long millis = System.currentTimeMillis();

     Timestamp timestamp = Timestamp.newBuilder().setSeconds(millis / 1000)
         .setNanos((int) ((millis % 1000) * 1000000)).build();


 Example 5: Compute Timestamp from current time in Python.

     timestamp = Timestamp()
     timestamp.GetCurrentTime()

 # JSON Mapping

 In JSON format, the Timestamp type is encoded as a string in the
 [RFC 3339](https://www.ietf.org/rfc/rfc3339.txt) format. That is, the
 format is "{year}-{month}-{day}T{hour}:{min}:{sec}[.{frac_sec}]Z"
 where {year} is always expressed using four digits while {month}, {day},
 {hour}, {min}, and {sec} are zero-padded to two digits each. The fractional
 seconds, which can go up to 9 digits (i.e. up to 1 nanosecond resolution),
 are optional. The "Z" suffix indicates the timezone ("UTC"); the timezone
 is required. A proto3 JSON serializer should always use UTC (as indicated by
 "Z") when printing the Timestamp type and a proto3 JSON parser should be
 able to accept both UTC and other timezones (as indicated by an offset).

 For example, "2017-01-15T01:30:15.01Z" encodes 15.01 seconds past
 01:30 UTC on January 15, 2017.

 In JavaScript, one can convert a Date object to this format using the
 standard
 [toISOString()](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date/toISOString)
 method. In Python, a standard `datetime.datetime` object can be converted
 to this format using
 [`strftime`](https://docs.python.org/2/library/time.html#time.strftime) with
 the time format spec '%Y-%m-%dT%H:%M:%S.%fZ'. Likewise, in Java, one can use
 the Joda Time's [`ISODateTimeFormat.dateTime()`](
 http://www.joda.org/joda-time/apidocs/org/joda/time/format/ISODateTimeFormat.html#dateTime%2D%2D
 ) to obtain a formatter capable of generating timestamps in this format.





 ~
�
  �� Represents seconds of UTC time since Unix epoch
 1970-01-01T00:00:00Z. Must be from 0001-01-01T00:00:00Z to
 9999-12-31T23:59:59Z inclusive.


  �

  �

  �
�
 �� Non-negative fractions of a second at nanosecond resolution. Negative
 second values with fractions must still have non-negative nanos values
 that count forward in time. Must be from 0 to 999,999,999
 inclusive.


 �

 �

 �bproto3
��
 google/protobuf/descriptor.protogoogle.protobuf"M
FileDescriptorSet8
file (2$.google.protobuf.FileDescriptorProtoRfile"�
FileDescriptorProto
name (	Rname
package (	Rpackage

dependency (	R
dependency+
public_dependency
 (RpublicDependency'
weak_dependency (RweakDependencyC
message_type (2 .google.protobuf.DescriptorProtoRmessageTypeA
	enum_type (2$.google.protobuf.EnumDescriptorProtoRenumTypeA
service (2'.google.protobuf.ServiceDescriptorProtoRserviceC
	extension (2%.google.protobuf.FieldDescriptorProtoR	extension6
options (2.google.protobuf.FileOptionsRoptionsI
source_code_info	 (2.google.protobuf.SourceCodeInfoRsourceCodeInfo
syntax (	Rsyntax"�
DescriptorProto
name (	Rname;
field (2%.google.protobuf.FieldDescriptorProtoRfieldC
	extension (2%.google.protobuf.FieldDescriptorProtoR	extensionA
nested_type (2 .google.protobuf.DescriptorProtoR
nestedTypeA
	enum_type (2$.google.protobuf.EnumDescriptorProtoRenumTypeX
extension_range (2/.google.protobuf.DescriptorProto.ExtensionRangeRextensionRangeD

oneof_decl (2%.google.protobuf.OneofDescriptorProtoR	oneofDecl9
options (2.google.protobuf.MessageOptionsRoptionsU
reserved_range	 (2..google.protobuf.DescriptorProto.ReservedRangeRreservedRange#
reserved_name
 (	RreservedNamez
ExtensionRange
start (Rstart
end (Rend@
options (2&.google.protobuf.ExtensionRangeOptionsRoptions7
ReservedRange
start (Rstart
end (Rend"|
ExtensionRangeOptionsX
uninterpreted_option� (2$.google.protobuf.UninterpretedOptionRuninterpretedOption*	�����"�
FieldDescriptorProto
name (	Rname
number (RnumberA
label (2+.google.protobuf.FieldDescriptorProto.LabelRlabel>
type (2*.google.protobuf.FieldDescriptorProto.TypeRtype
	type_name (	RtypeName
extendee (	Rextendee#
default_value (	RdefaultValue
oneof_index	 (R
oneofIndex
	json_name
 (	RjsonName7
options (2.google.protobuf.FieldOptionsRoptions"�
Type
TYPE_DOUBLE

TYPE_FLOAT

TYPE_INT64
TYPE_UINT64

TYPE_INT32
TYPE_FIXED64
TYPE_FIXED32
	TYPE_BOOL
TYPE_STRING	

TYPE_GROUP

TYPE_MESSAGE

TYPE_BYTES
TYPE_UINT32
	TYPE_ENUM
TYPE_SFIXED32
TYPE_SFIXED64
TYPE_SINT32
TYPE_SINT64"C
Label
LABEL_OPTIONAL
LABEL_REQUIRED
LABEL_REPEATED"c
OneofDescriptorProto
name (	Rname7
options (2.google.protobuf.OneofOptionsRoptions"�
EnumDescriptorProto
name (	Rname?
value (2).google.protobuf.EnumValueDescriptorProtoRvalue6
options (2.google.protobuf.EnumOptionsRoptions]
reserved_range (26.google.protobuf.EnumDescriptorProto.EnumReservedRangeRreservedRange#
reserved_name (	RreservedName;
EnumReservedRange
start (Rstart
end (Rend"�
EnumValueDescriptorProto
name (	Rname
number (Rnumber;
options (2!.google.protobuf.EnumValueOptionsRoptions"�
ServiceDescriptorProto
name (	Rname>
method (2&.google.protobuf.MethodDescriptorProtoRmethod9
options (2.google.protobuf.ServiceOptionsRoptions"�
MethodDescriptorProto
name (	Rname

input_type (	R	inputType
output_type (	R
outputType8
options (2.google.protobuf.MethodOptionsRoptions0
client_streaming (:falseRclientStreaming0
server_streaming (:falseRserverStreaming"�	
FileOptions!
java_package (	RjavaPackage0
java_outer_classname (	RjavaOuterClassname5
java_multiple_files
 (:falseRjavaMultipleFilesD
java_generate_equals_and_hash (BRjavaGenerateEqualsAndHash:
java_string_check_utf8 (:falseRjavaStringCheckUtf8S
optimize_for	 (2).google.protobuf.FileOptions.OptimizeMode:SPEEDRoptimizeFor

go_package (	R	goPackage5
cc_generic_services (:falseRccGenericServices9
java_generic_services (:falseRjavaGenericServices5
py_generic_services (:falseRpyGenericServices7
php_generic_services* (:falseRphpGenericServices%

deprecated (:falseR
deprecated/
cc_enable_arenas (:falseRccEnableArenas*
objc_class_prefix$ (	RobjcClassPrefix)
csharp_namespace% (	RcsharpNamespace!
swift_prefix' (	RswiftPrefix(
php_class_prefix( (	RphpClassPrefix#
php_namespace) (	RphpNamespace4
php_metadata_namespace, (	RphpMetadataNamespace!
ruby_package- (	RrubyPackageX
uninterpreted_option� (2$.google.protobuf.UninterpretedOptionRuninterpretedOption":
OptimizeMode	
SPEED
	CODE_SIZE
LITE_RUNTIME*	�����J&'"�
MessageOptions<
message_set_wire_format (:falseRmessageSetWireFormatL
no_standard_descriptor_accessor (:falseRnoStandardDescriptorAccessor%

deprecated (:falseR
deprecated
	map_entry (RmapEntryX
uninterpreted_option� (2$.google.protobuf.UninterpretedOptionRuninterpretedOption*	�����J	J	
"�
FieldOptionsA
ctype (2#.google.protobuf.FieldOptions.CType:STRINGRctype
packed (RpackedG
jstype (2$.google.protobuf.FieldOptions.JSType:	JS_NORMALRjstype
lazy (:falseRlazy%

deprecated (:falseR
deprecated
weak
 (:falseRweakX
uninterpreted_option� (2$.google.protobuf.UninterpretedOptionRuninterpretedOption"/
CType

STRING 
CORD
STRING_PIECE"5
JSType
	JS_NORMAL 
	JS_STRING
	JS_NUMBER*	�����J"s
OneofOptionsX
uninterpreted_option� (2$.google.protobuf.UninterpretedOptionRuninterpretedOption*	�����"�
EnumOptions
allow_alias (R
allowAlias%

deprecated (:falseR
deprecatedX
uninterpreted_option� (2$.google.protobuf.UninterpretedOptionRuninterpretedOption*	�����J"�
EnumValueOptions%

deprecated (:falseR
deprecatedX
uninterpreted_option� (2$.google.protobuf.UninterpretedOptionRuninterpretedOption*	�����"�
ServiceOptions%

deprecated! (:falseR
deprecatedX
uninterpreted_option� (2$.google.protobuf.UninterpretedOptionRuninterpretedOption*	�����"�
MethodOptions%

deprecated! (:falseR
deprecatedq
idempotency_level" (2/.google.protobuf.MethodOptions.IdempotencyLevel:IDEMPOTENCY_UNKNOWNRidempotencyLevelX
uninterpreted_option� (2$.google.protobuf.UninterpretedOptionRuninterpretedOption"P
IdempotencyLevel
IDEMPOTENCY_UNKNOWN 
NO_SIDE_EFFECTS

IDEMPOTENT*	�����"�
UninterpretedOptionA
name (2-.google.protobuf.UninterpretedOption.NamePartRname)
identifier_value (	RidentifierValue,
positive_int_value (RpositiveIntValue,
negative_int_value (RnegativeIntValue!
double_value (RdoubleValue!
string_value (RstringValue'
aggregate_value (	RaggregateValueJ
NamePart
	name_part (	RnamePart!
is_extension (RisExtension"�
SourceCodeInfoD
location (2(.google.protobuf.SourceCodeInfo.LocationRlocation�
Location
path (BRpath
span (BRspan)
leading_comments (	RleadingComments+
trailing_comments (	RtrailingComments:
leading_detached_comments (	RleadingDetachedComments"�
GeneratedCodeInfoM

annotation (2-.google.protobuf.GeneratedCodeInfo.AnnotationR
annotationm

Annotation
path (BRpath
source_file (	R
sourceFile
begin (Rbegin
end (RendB�
com.google.protobufBDescriptorProtosHZ>github.com/golang/protobuf/protoc-gen-go/descriptor;descriptor��GPB�Google.Protobuf.ReflectionJʾ
' �
�
' 2� Protocol Buffers - Google's data interchange format
 Copyright 2008 Google Inc.  All rights reserved.
 https://developers.google.com/protocol-buffers/

 Redistribution and use in source and binary forms, with or without
 modification, are permitted provided that the following conditions are
 met:

     * Redistributions of source code must retain the above copyright
 notice, this list of conditions and the following disclaimer.
     * Redistributions in binary form must reproduce the above
 copyright notice, this list of conditions and the following disclaimer
 in the documentation and/or other materials provided with the
 distribution.
     * Neither the name of Google Inc. nor the names of its
 contributors may be used to endorse or promote products derived from
 this software without specific prior written permission.

 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
 A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
 OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
 SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
 LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
2� Author: kenton@google.com (Kenton Varda)
  Based on original Protocol Buffers design by
  Sanjay Ghemawat, Jeff Dean, and others.

 The messages in this file describe the definitions found in .proto files.
 A valid .proto file can be translated directly to a FileDescriptorProto
 without any other information (e.g. without reading its imports).


) 

+ U
	
+ U

, ,
	
, ,

- 1
	
- 1

. 7
	
%. 7

/ !
	
$/ !

0 
	
0 

4 

	4 t descriptor.proto must be optimized for speed because reflection-based
 algorithms don't work during bootstrapping.

j
 8 :^ The protocol compiler can output a FileDescriptorSet containing the .proto
 files it parses.



 8

  9(

  9


  9

  9#

  9&'
/
= Z# Describes a complete .proto file.



=
9
 >", file name, relative to root of source tree


 >


 >

 >

 >
*
?" e.g. "foo", "foo.bar", etc.


?


?

?

?
4
B!' Names of files imported by this file.


B


B

B

B 
Q
D(D Indexes of the public imported files in the dependency list above.


D


D

D"

D%'
z
G&m Indexes of the weak imported files in the dependency list.
 For Google-internal migration only. Do not use.


G


G

G 

G#%
6
J,) All top-level definitions in this file.


J


J

J'

J*+

K-

K


K

K(

K+,

L.

L


L!

L")

L,-

M.

M


M

M )

M,-

	O#

	O


	O

	O

	O!"
�

U/� This field contains optional information about the original source code.
 You may safely remove this entire field without harming runtime
 functionality of the descriptors -- the information is needed only by
 development tools.



U



U


U*


U-.
]
YP The syntax of the proto file.
 The supported values are "proto2" and "proto3".


Y


Y

Y

Y
'
] } Describes a message type.



]

 ^

 ^


 ^

 ^

 ^

`*

`


`

` %

`()

a.

a


a

a )

a,-

c+

c


c

c&

c)*

d-

d


d

d(

d+,

 fk

 f


  g" Inclusive.


  g

  g

  g

  g

 h" Exclusive.


 h

 h

 h

 h

 j/

 j

 j"

 j#*

 j-.

l.

l


l

l)

l,-

n/

n


n

n *

n-.

p&

p


p

p!

p$%
�
ux� Range of reserved tag numbers. Reserved tag numbers may not be used by
 fields or extension ranges in the same message. Reserved ranges may
 not overlap.


u


 v" Inclusive.


 v

 v

 v

 v

w" Exclusive.


w

w

w

w

y,

y


y

y'

y*+
�
	|%u Reserved field names, which may not be used by fields in the same message.
 A given name may only be reserved once.


	|


	|

	|

	|"$

 �



O
 �:A The parser stores options it doesn't recognize here. See above.


 �


 �

 �3

 �69
Z
�M Clients can define custom options in extensions of this message. See above.


 �

 �

 �
3
� �% Describes a field within a message.


�

 ��

 �
S
  �C 0 is reserved for errors.
 Order is weird for historical reasons.


  �

  �

 �

 �

 �
w
 �g Not ZigZag encoded.  Negative numbers take 10 bytes.  Use TYPE_SINT64 if
 negative values are likely.


 �

 �

 �

 �

 �
w
 �g Not ZigZag encoded.  Negative numbers take 10 bytes.  Use TYPE_SINT32 if
 negative values are likely.


 �

 �

 �

 �

 �

 �

 �

 �

 �

 �

 �

 �

 �

 �
�
 	�� Tag-delimited aggregate.
 Group type is deprecated and not supported in proto3. However, Proto3
 implementations should still be able to parse the group wire format and
 treat group fields as unknown fields.


 	�

 	�
-
 
�" Length-delimited aggregate.


 
�

 
�
#
 � New in version 2.


 �

 �

 �

 �

 �

 �

 �

 �

 �

 �

 �

 �

 �

 �
'
 �" Uses ZigZag encoding.


 �

 �
'
 �" Uses ZigZag encoding.


 �

 �

��

�
*
 � 0 is reserved for errors


 �

 �

�

�

�

�

�

�

 �

 �


 �

 �

 �

�

�


�

�

�

�

�


�

�

�
�
�� If type_name is set, this need not be set.  If both this and type_name
 are set, this must be one of TYPE_ENUM, TYPE_MESSAGE or TYPE_GROUP.


�


�

�

�
�
� � For message and enum types, this is the name of the type.  If the name
 starts with a '.', it is fully-qualified.  Otherwise, C++-like scoping
 rules are used to find the type (i.e. first the nested types within this
 message are searched, then within the parent, on up to the root
 namespace).


�


�

�

�
~
�p For extensions, this is the name of the type being extended.  It is
 resolved in the same manner as type_name.


�


�

�

�
�
�$� For numeric types, contains the original text representation of the value.
 For booleans, "true" or "false".
 For strings, contains the default text contents (not escaped in any way).
 For bytes, contains the C escaped value.  All bytes >= 128 are escaped.
 TODO(kenton):  Base-64 encode?


�


�

�

�"#
�
�!v If set, gives the index of a oneof in the containing type's oneof_decl
 list.  This field is a member of that oneof.


�


�

�

� 
�
�!� JSON name of this field. The value is set by protocol compiler. If the
 user has set a "json_name" option on this field, that option's value
 will be used. Otherwise, it's deduced from the field's name by converting
 it to camelCase.


�


�

�

� 

	�$

	�


	�

	�

	�"#
"
� � Describes a oneof.


�

 �

 �


 �

 �

 �

�$

�


�

�

�"#
'
� � Describes an enum type.


�

 �

 �


 �

 �

 �

�.

�


�#

�$)

�,-

�#

�


�

�

�!"
�
 ��� Range of reserved numeric values. Reserved values may not be used by
 entries in the same enum. Reserved ranges may not overlap.

 Note that this is distinct from DescriptorProto.ReservedRange in that it
 is inclusive such that it can appropriately represent the entire int32
 domain.


 �


  �" Inclusive.


  �

  �

  �

  �

 �" Inclusive.


 �

 �

 �

 �
�
�0� Range of reserved numeric values. Reserved numeric values may not be used
 by enum values in the same enum declaration. Reserved ranges may not
 overlap.


�


�

�+

�./
l
�$^ Reserved enum value names, which may not be reused. A given name may only
 be reserved once.


�


�

�

�"#
1
� �# Describes a value within an enum.


� 

 �

 �


 �

 �

 �

�

�


�

�

�

�(

�


�

�#

�&'
$
� � Describes a service.


�

 �

 �


 �

 �

 �

�,

�


� 

�!'

�*+

�&

�


�

�!

�$%
0
	� �" Describes a method of a service.


	�

	 �

	 �


	 �

	 �

	 �
�
	�!� Input and output type names.  These are resolved in the same way as
 FieldDescriptorProto.type_name, but must refer to a message type.


	�


	�

	�

	� 

	�"

	�


	�

	�

	� !

	�%

	�


	�

	� 

	�#$
E
	�77 Identifies if client streams multiple client messages


	�


	�

	� 

	�#$

	�%6

	�05
E
	�77 Identifies if server streams multiple server messages


	�


	�

	� 

	�#$

	�%6

	�05
�

� �2N ===================================================================
 Options
2� Each of the definitions above may have "options" attached.  These are
 just annotations which may cause code to be generated slightly differently
 or may contain hints for code that manipulates protocol messages.

 Clients may define custom options as extensions of the *Options messages.
 These extensions may not yet be known at parsing time, so the parser cannot
 store the values in them.  Instead it stores them in a field in the *Options
 message called uninterpreted_option. This field must have the same name
 across all *Options messages. We then use this field to populate the
 extensions when we build a descriptor, at which point all protos have been
 parsed and so all extensions are known.

 Extension numbers for custom options may be chosen as follows:
 * For options which will only be used within a single application or
   organization, or for experimental options, use field numbers 50000
   through 99999.  It is up to you to ensure that you do not use the
   same number for multiple options.
 * For options which will be published and used publicly by multiple
   independent entities, e-mail protobuf-global-extension-registry@google.com
   to reserve extension numbers. Simply provide your project name (e.g.
   Objective-C plugin) and your project website (if available) -- there's no
   need to explain how you intend to use them. Usually you only need one
   extension number. You can declare multiple options with only one extension
   number by putting them in a sub-message. See the Custom Options section of
   the docs for examples:
   https://developers.google.com/protocol-buffers/docs/proto#options
   If this turns out to be popular, a web service will be set up
   to automatically assign option numbers.



�
�

 �#� Sets the Java package where classes generated from this .proto will be
 placed.  By default, the proto package is used, but this is often
 inappropriate because proto packages do not normally start with backwards
 domain names.



 �



 �


 �


 �!"
�

�+� If set, all the classes from the .proto file are wrapped in a single
 outer class with the given name.  This applies to both Proto1
 (equivalent to the old "--one_java_file" option) and Proto2 (where
 a .proto always translates to a single class, but you may want to
 explicitly choose the class name).



�



�


�&


�)*
�

�;� If set true, then the Java code generator will generate a separate .java
 file for each top-level message, enum, and service defined in the .proto
 file.  Thus, these types will *not* be nested inside the outer class
 named by java_outer_classname.  However, the outer class will still be
 generated to contain the file's getDescriptor() method as well as any
 top-level extensions defined in the file.



�



�


�#


�&(


�):


�49
)

�E This option does nothing.



�



�


�-


�02


�3D


�4C
�

�>� If set true, then the Java2 code generator will generate code that
 throws an exception whenever an attempt is made to assign a non-UTF-8
 byte sequence to a string field.
 Message reflection will do the same.
 However, an extension field still accepts non-UTF-8 byte sequences.
 This option has no effect on when used with the lite runtime.



�



�


�&


�)+


�,=


�7<
L

 ��< Generated classes can be optimized for speed or code size.



 �
D

  �"4 Generate complete code for parsing, serialization,



  �	


  �
G

 � etc.
"/ Use ReflectionOps to implement these methods.



 �


 �
G

 �"7 Generate code using MessageLite and the lite runtime.



 �


 �


�;


�



�


�$


�'(


�):


�49
�

�"� Sets the Go package where structs generated from this .proto will be
 placed. If omitted, the Go package will be derived from the following:
   - The basename of the package import path, if provided.
   - Otherwise, the package statement in the .proto file, if present.
   - Otherwise, the basename of the .proto file, without extension.



�



�


�


�!
�

�;� Should generic services be generated in each language?  "Generic" services
 are not specific to any particular RPC system.  They are generated by the
 main code generators in each language (without additional plugins).
 Generic services were the only kind of service generation supported by
 early versions of google.protobuf.

 Generic services are now considered deprecated in favor of using plugins
 that generate code specific to your particular RPC system.  Therefore,
 these default to false.  Old code which depends on generic services should
 explicitly set them to true.



�



�


�#


�&(


�):


�49


�=


�



�


�%


�(*


�+<


�6;


	�;


	�



	�


	�#


	�&(


	�):


	�49



�<



�




�



�$



�')



�*;



�5:
�

�2� Is this file deprecated?
 Depending on the target platform, this can emit Deprecated annotations
 for everything in the file, or it will be completely ignored; in the very
 least, this is a formalization for deprecating files.



�



�


�


�


� 1


�+0


�8q Enables the use of arenas for the proto messages in this file. This applies
 only to generated classes for C++.



�



�


� 


�#%


�&7


�16
�

�)� Sets the objective c class prefix which is prepended to all objective c
 generated classes from this .proto. There is no default.



�



�


�#


�&(
I

�(; Namespace for generated classes; defaults to the package.



�



�


�"


�%'
�

�$� By default Swift generators will take the proto package and CamelCase it
 replacing '.' with underscore and use that to prefix the types/symbols
 defined. When this options is provided, they will use this value instead
 to prefix the types/symbols defined.



�



�


�


�!#
~

�(p Sets the php class prefix which is prepended to all php generated classes
 from this .proto. Default is empty.



�



�


�"


�%'
�

�%� Use this option to change the namespace of php generated classes. Default
 is empty. When this option is empty, the package name will be used for
 determining the namespace.



�



�


�


�"$
�

�.� Use this option to change the namespace of php generated metadata classes.
 Default is empty. When this option is empty, the proto file name will be
 used for determining the namespace.



�



�


�(


�+-
�

�$� Use this option to change the package of ruby generated classes. Default
 is empty. When this option is not set, the package name will be used for
 determining the ruby package.



�



�


�


�!#
|

�:n The parser stores options it doesn't recognize here.
 See the documentation for the "Options" section above.



�



�


�3


�69
�

�z Clients can define custom options in extensions of this message.
 See the documentation for the "Options" section above.



 �


 �


 �


	�


	 �


	 �


	 �

� �

�
�
 �>� Set true to use the old proto1 MessageSet wire format for extensions.
 This is provided for backwards-compatibility with the MessageSet wire
 format.  You should not use this for any other reason:  It's less
 efficient, has fewer features, and is more complicated.

 The message must be defined exactly as follows:
   message Foo {
     option message_set_wire_format = true;
     extensions 4 to max;
   }
 Note that the message cannot have any defined fields; MessageSets only
 have extensions.

 All extensions of your type must be singular messages; e.g. they cannot
 be int32s, enums, or repeated messages.

 Because this is an option, the above two restrictions are not enforced by
 the protocol compiler.


 �


 �

 �'

 �*+

 �,=

 �7<
�
�F� Disables the generation of the standard "descriptor()" accessor, which can
 conflict with a field of the same name.  This is meant to make migration
 from proto1 easier; new code should avoid fields named "descriptor".


�


�

�/

�23

�4E

�?D
�
�1� Is this message deprecated?
 Depending on the target platform, this can emit Deprecated annotations
 for the message, or it will be completely ignored; in the very least,
 this is a formalization for deprecating messages.


�


�

�

�

�0

�*/
�
�� Whether the message is an automatically generated map entry type for the
 maps field.

 For maps fields:
     map<KeyType, ValueType> map_field = 1;
 The parsed descriptor looks like:
     message MapFieldEntry {
         option map_entry = true;
         optional KeyType key = 1;
         optional ValueType value = 2;
     }
     repeated MapFieldEntry map_field = 1;

 Implementations may choose not to generate the map_entry=true message, but
 use a native map in the target language to hold the keys and values.
 The reflection APIs in such implementations still need to work as
 if the field is a repeated message field.

 NOTE: Do not set the option in .proto files. Always use the maps syntax
 instead. The option should only be implicitly set by the proto compiler
 parser.


�


�

�

�
$
	�" javalite_serializable


	 �

	 �

	 �

	�" javanano_as_lite


	�

	�

	�
O
�:A The parser stores options it doesn't recognize here. See above.


�


�

�3

�69
Z
�M Clients can define custom options in extensions of this message. See above.


 �

 �

 �

� �

�
�
 �.� The ctype option instructs the C++ code generator to use a different
 representation of the field than it normally would.  See the specific
 options below.  This option is not yet implemented in the open source
 release -- sorry, we'll try to include it in a future version!


 �


 �

 �

 �

 �-

 �&,

 ��

 �

  � Default mode.


  �


  �

 �

 �

 �

 �

 �

 �
�
�� The packed option can be enabled for repeated primitive fields to enable
 a more efficient representation on the wire. Rather than repeatedly
 writing the tag and type for each element, the entire array is encoded as
 a single length-delimited blob. In proto3, only explicit setting it to
 false will avoid using packed encoding.


�


�

�

�
�
�3� The jstype option determines the JavaScript type used for values of the
 field.  The option is permitted only for 64 bit integral and fixed types
 (int64, uint64, sint64, fixed64, sfixed64).  A field with jstype JS_STRING
 is represented as JavaScript string, which avoids loss of precision that
 can happen when a large value is converted to a floating point JavaScript.
 Specifying JS_NUMBER for the jstype causes the generated JavaScript code to
 use the JavaScript "number" type.  The behavior of the default option
 JS_NORMAL is implementation dependent.

 This option is an enum to permit additional types to be added, e.g.
 goog.math.Integer.


�


�

�

�

�2

�(1

��

�
'
 � Use the default type.


 �

 �
)
� Use JavaScript strings.


�

�
)
� Use JavaScript numbers.


�

�
�
�+� Should this field be parsed lazily?  Lazy applies only to message-type
 fields.  It means that when the outer message is initially parsed, the
 inner message's contents will not be parsed but instead stored in encoded
 form.  The inner message will actually be parsed when it is first accessed.

 This is only a hint.  Implementations are free to choose whether to use
 eager or lazy parsing regardless of the value of this option.  However,
 setting this option true suggests that the protocol author believes that
 using lazy parsing on this field is worth the additional bookkeeping
 overhead typically needed to implement it.

 This option does not affect the public interface of any generated code;
 all method signatures remain the same.  Furthermore, thread-safety of the
 interface is not affected by this option; const methods remain safe to
 call from multiple threads concurrently, while non-const methods continue
 to require exclusive access.


 Note that implementations may choose not to check required fields within
 a lazy sub-message.  That is, calling IsInitialized() on the outer message
 may return true even if the inner message has missing required fields.
 This is necessary because otherwise the inner message would have to be
 parsed in order to perform the check, defeating the purpose of lazy
 parsing.  An implementation which chooses not to check required fields
 must be consistent about it.  That is, for any particular sub-message, the
 implementation must either *always* check its required fields, or *never*
 check its required fields, regardless of whether or not the message has
 been parsed.


�


�

�

�

�*

�$)
�
�1� Is this field deprecated?
 Depending on the target platform, this can emit Deprecated annotations
 for accessors, or it will be completely ignored; in the very least, this
 is a formalization for deprecating fields.


�


�

�

�

�0

�*/
?
�,1 For Google-internal migration only. Do not use.


�


�

�

�

�+

�%*
O
�:A The parser stores options it doesn't recognize here. See above.


�


�

�3

�69
Z
�M Clients can define custom options in extensions of this message. See above.


 �

 �

 �

	�" removed jtype


	 �

	 �

	 �

� �

�
O
 �:A The parser stores options it doesn't recognize here. See above.


 �


 �

 �3

 �69
Z
�M Clients can define custom options in extensions of this message. See above.


 �

 �

 �

� �

�
`
 � R Set this option to true to allow mapping different tag names to the same
 value.


 �


 �

 �

 �
�
�1� Is this enum deprecated?
 Depending on the target platform, this can emit Deprecated annotations
 for the enum, or it will be completely ignored; in the very least, this
 is a formalization for deprecating enums.


�


�

�

�

�0

�*/

	�" javanano_as_lite


	 �

	 �

	 �
O
�:A The parser stores options it doesn't recognize here. See above.


�


�

�3

�69
Z
�M Clients can define custom options in extensions of this message. See above.


 �

 �

 �

� �

�
�
 �1� Is this enum value deprecated?
 Depending on the target platform, this can emit Deprecated annotations
 for the enum value, or it will be completely ignored; in the very least,
 this is a formalization for deprecating enum values.


 �


 �

 �

 �

 �0

 �*/
O
�:A The parser stores options it doesn't recognize here. See above.


�


�

�3

�69
Z
�M Clients can define custom options in extensions of this message. See above.


 �

 �

 �

� �

�
�
 �2� Is this service deprecated?
 Depending on the target platform, this can emit Deprecated annotations
 for the service, or it will be completely ignored; in the very least,
 this is a formalization for deprecating services.
2� Note:  Field numbers 1 through 32 are reserved for Google's internal RPC
   framework.  We apologize for hoarding these numbers to ourselves, but
   we were already using them long before we decided to release Protocol
   Buffers.


 �


 �

 �

 �

 � 1

 �+0
O
�:A The parser stores options it doesn't recognize here. See above.


�


�

�3

�69
Z
�M Clients can define custom options in extensions of this message. See above.


 �

 �

 �

� �

�
�
 �2� Is this method deprecated?
 Depending on the target platform, this can emit Deprecated annotations
 for the method, or it will be completely ignored; in the very least,
 this is a formalization for deprecating methods.
2� Note:  Field numbers 1 through 32 are reserved for Google's internal RPC
   framework.  We apologize for hoarding these numbers to ourselves, but
   we were already using them long before we decided to release Protocol
   Buffers.


 �


 �

 �

 �

 � 1

 �+0
�
 ��� Is this method side-effect-free (or safe in HTTP parlance), or idempotent,
 or neither? HTTP based RPC implementation may choose GET verb for safe
 methods, and PUT verb for idempotent methods instead of the default POST.


 �

  �

  �

  �
$
 �" implies idempotent


 �

 �
7
 �"' idempotent, but may have side effects


 �

 �

��&

�


�

�-

�02

�%

�$
O
�:A The parser stores options it doesn't recognize here. See above.


�


�

�3

�69
Z
�M Clients can define custom options in extensions of this message. See above.


 �

 �

 �
�
� �� A message representing a option the parser does not recognize. This only
 appears in options protos created by the compiler::Parser class.
 DescriptorPool resolves these when building Descriptor objects. Therefore,
 options protos in descriptor objects (e.g. returned by Descriptor::options(),
 or produced by Descriptor::CopyTo()) will never have UninterpretedOptions
 in them.


�
�
 ��� The name of the uninterpreted option.  Each string represents a segment in
 a dot-separated name.  is_extension is true iff a segment represents an
 extension (denoted with parentheses in options specs in .proto files).
 E.g.,{ ["foo", false], ["bar.baz", true], ["qux", false] } represents
 "foo.(bar.baz).qux".


 �


  �"

  �

  �

  �

  � !

 �#

 �

 �

 �

 �!"

 �

 �


 �

 �

 �
�
�'� The value of the uninterpreted option, in whatever type the tokenizer
 identified it as during parsing. Exactly one of these should be set.


�


�

�"

�%&

�)

�


�

�$

�'(

�(

�


�

�#

�&'

�#

�


�

�

�!"

�"

�


�

�

� !

�&

�


�

�!

�$%
�
� �j Encapsulates information about the original source file from which a
 FileDescriptorProto was generated.
2` ===================================================================
 Optional source code info


�
�
 �!� A Location identifies a piece of source code in a .proto file which
 corresponds to a particular definition.  This information is intended
 to be useful to IDEs, code indexers, documentation generators, and similar
 tools.

 For example, say we have a file like:
   message Foo {
     optional string foo = 1;
   }
 Let's look at just the field definition:
   optional string foo = 1;
   ^       ^^     ^^  ^  ^^^
   a       bc     de  f  ghi
 We have the following locations:
   span   path               represents
   [a,i)  [ 4, 0, 2, 0 ]     The whole field definition.
   [a,b)  [ 4, 0, 2, 0, 4 ]  The label (optional).
   [c,d)  [ 4, 0, 2, 0, 5 ]  The type (string).
   [e,f)  [ 4, 0, 2, 0, 1 ]  The name (foo).
   [g,h)  [ 4, 0, 2, 0, 3 ]  The number (1).

 Notes:
 - A location may refer to a repeated field itself (i.e. not to any
   particular index within it).  This is used whenever a set of elements are
   logically enclosed in a single code segment.  For example, an entire
   extend block (possibly containing multiple extension definitions) will
   have an outer location whose path refers to the "extensions" repeated
   field without an index.
 - Multiple locations may have the same path.  This happens when a single
   logical declaration is spread out across multiple places.  The most
   obvious example is the "extend" block again -- there may be multiple
   extend blocks in the same scope, each of which will have the same path.
 - A location's span is not always a subset of its parent's span.  For
   example, the "extendee" of an extension declaration appears at the
   beginning of the "extend" block and is shared by all extensions within
   the block.
 - Just because a location's span is a subset of some other location's span
   does not mean that it is a descendant.  For example, a "group" defines
   both a type and a field in a single declaration.  Thus, the locations
   corresponding to the type and field and their components will overlap.
 - Code which tries to interpret locations should probably be designed to
   ignore those that it doesn't understand, as more types of locations could
   be recorded in the future.


 �


 �

 �

 � 

 ��

 �

�
  �,� Identifies which part of the FileDescriptorProto was defined at this
 location.

 Each element is a field number or an index.  They form a path from
 the root FileDescriptorProto to the place where the definition.  For
 example, this path:
   [ 4, 3, 2, 7, 1 ]
 refers to:
   file.message_type(3)  // 4, 3
       .field(7)         // 2, 7
       .name()           // 1
 This is because FileDescriptorProto.message_type has field number 4:
   repeated DescriptorProto message_type = 4;
 and DescriptorProto.field has field number 2:
   repeated FieldDescriptorProto field = 2;
 and FieldDescriptorProto.name has field number 1:
   optional string name = 1;

 Thus, the above path gives the location of a field name.  If we removed
 the last element:
   [ 4, 3, 2, 7 ]
 this path refers to the whole field declaration (from the beginning
 of the label to the terminating semicolon).


  �

  �

  �

  �

  �+

  �*
�
 �,� Always has exactly three or four elements: start line, start column,
 end line (optional, otherwise assumed same as start line), end column.
 These are packed into a single field for efficiency.  Note that line
 and column numbers are zero-based -- typically you will want to add
 1 to each before displaying to a user.


 �

 �

 �

 �

 �+

 �*
�
 �)� If this SourceCodeInfo represents a complete declaration, these are any
 comments appearing before and after the declaration which appear to be
 attached to the declaration.

 A series of line comments appearing on consecutive lines, with no other
 tokens appearing on those lines, will be treated as a single comment.

 leading_detached_comments will keep paragraphs of comments that appear
 before (but not connected to) the current element. Each paragraph,
 separated by empty lines, will be one comment element in the repeated
 field.

 Only the comment content is provided; comment markers (e.g. //) are
 stripped out.  For block comments, leading whitespace and an asterisk
 will be stripped from the beginning of each line other than the first.
 Newlines are included in the output.

 Examples:

   optional int32 foo = 1;  // Comment attached to foo.
   // Comment attached to bar.
   optional int32 bar = 2;

   optional string baz = 3;
   // Comment attached to baz.
   // Another line attached to baz.

   // Comment attached to qux.
   //
   // Another line attached to qux.
   optional double qux = 4;

   // Detached comment for corge. This is not leading or trailing comments
   // to qux or corge because there are blank lines separating it from
   // both.

   // Detached comment for corge paragraph 2.

   optional string corge = 5;
   /* Block comment attached
    * to corge.  Leading asterisks
    * will be removed. */
   /* Block comment attached to
    * grault. */
   optional int32 grault = 6;

   // ignored detached comments.


 �

 �

 �$

 �'(

 �*

 �

 �

 �%

 �()

 �2

 �

 �

 �-

 �01
�
� �� Describes the relationship between generated code and its original source
 file. A GeneratedCodeInfo message is associated with only one generated
 source file, but may contain references to different source .proto files.


�
x
 �%j An Annotation connects some span of text in generated code to an element
 of its generating .proto file.


 �


 �

 � 

 �#$

 ��

 �

�
  �, Identifies the element in the original source .proto file. This field
 is formatted the same as SourceCodeInfo.Location.path.


  �

  �

  �

  �

  �+

  �*
O
 �$? Identifies the filesystem path to the original source .proto.


 �

 �

 �

 �"#
w
 �g Identifies the starting offset in bytes in the generated code
 that relates to the identified object.


 �

 �

 �

 �
�
 �� Identifies the ending offset in bytes in the generated code that
 relates to the identified offset. The end offset should be one past
 the last relevant byte (so the length of the text = end - begin).


 �

 �

 �

 �
�,
google/protobuf/any.protogoogle.protobuf"6
Any
type_url (	RtypeUrl
value (RvalueBo
com.google.protobufBAnyProtoPZ%github.com/golang/protobuf/ptypes/any�GPB�Google.Protobuf.WellKnownTypesJ�*
 �
�
 2� Protocol Buffers - Google's data interchange format
 Copyright 2008 Google Inc.  All rights reserved.
 https://developers.google.com/protocol-buffers/

 Redistribution and use in source and binary forms, with or without
 modification, are permitted provided that the following conditions are
 met:

     * Redistributions of source code must retain the above copyright
 notice, this list of conditions and the following disclaimer.
     * Redistributions in binary form must reproduce the above
 copyright notice, this list of conditions and the following disclaimer
 in the documentation and/or other materials provided with the
 distribution.
     * Neither the name of Google Inc. nor the names of its
 contributors may be used to endorse or promote products derived from
 this software without specific prior written permission.

 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
 A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
 OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
 SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
 LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.


  

" ;
	
%" ;

# <
	
# <

$ ,
	
$ ,

% )
	
% )

& "
	

& "

' !
	
$' !
�
 y �� `Any` contains an arbitrary serialized protocol buffer message along with a
 URL that describes the type of the serialized message.

 Protobuf library provides support to pack/unpack Any values in the form
 of utility functions or additional generated methods of the Any type.

 Example 1: Pack and unpack a message in C++.

     Foo foo = ...;
     Any any;
     any.PackFrom(foo);
     ...
     if (any.UnpackTo(&foo)) {
       ...
     }

 Example 2: Pack and unpack a message in Java.

     Foo foo = ...;
     Any any = Any.pack(foo);
     ...
     if (any.is(Foo.class)) {
       foo = any.unpack(Foo.class);
     }

  Example 3: Pack and unpack a message in Python.

     foo = Foo(...)
     any = Any()
     any.Pack(foo)
     ...
     if any.Is(Foo.DESCRIPTOR):
       any.Unpack(foo)
       ...

  Example 4: Pack and unpack a message in Go

      foo := &pb.Foo{...}
      any, err := ptypes.MarshalAny(foo)
      ...
      foo := &pb.Foo{}
      if err := ptypes.UnmarshalAny(any, foo); err != nil {
        ...
      }

 The pack methods provided by protobuf library will by default use
 'type.googleapis.com/full.type.name' as the type URL and the unpack
 methods only use the fully qualified type name after the last '/'
 in the type URL, for example "foo.bar.com/x/y.z" will yield type
 name "y.z".


 JSON
 ====
 The JSON representation of an `Any` value uses the regular
 representation of the deserialized, embedded message, with an
 additional field `@type` which contains the type URL. Example:

     package google.profile;
     message Person {
       string first_name = 1;
       string last_name = 2;
     }

     {
       "@type": "type.googleapis.com/google.profile.Person",
       "firstName": <string>,
       "lastName": <string>
     }

 If the embedded message type is well-known and has a custom JSON
 representation, that representation will be embedded adding a field
 `value` which holds the custom JSON in addition to the `@type`
 field. Example (for message [google.protobuf.Duration][]):

     {
       "@type": "type.googleapis.com/google.protobuf.Duration",
       "value": "1.212s"
     }




 y
�

  ��
 A URL/resource name that uniquely identifies the type of the serialized
 protocol buffer message. This string must contain at least
 one "/" character. The last segment of the URL's path must represent
 the fully qualified name of the type (as in
 `path/google.protobuf.Duration`). The name should be in a canonical form
 (e.g., leading "." is not accepted).

 In practice, teams usually precompile into the binary all types that they
 expect it to use in the context of Any. However, for URLs which use the
 scheme `http`, `https`, or no scheme, one can optionally set up a type
 server that maps type URLs to message definitions as follows:

 * If no scheme is provided, `https` is assumed.
 * An HTTP GET on the URL must yield a [google.protobuf.Type][]
   value in binary format, or produce an error.
 * Applications are allowed to cache lookup results based on the
   URL, or have them precompiled into a binary to avoid any
   lookup. Therefore, binary compatibility needs to be preserved
   on changes to types. (Use versioned type names to manage
   breaking changes.)

 Note: this functionality is not currently available in the official
 protobuf release, and it is not used for type URLs beginning with
 type.googleapis.com.

 Schemes other than `http`, `https` (or the empty scheme) might be
 used with implementation specific semantics.



  �

  �	

  �
W
 �I Must be a valid serialized protocol buffer of the above specified type.


 �

 �

 �bproto3
�#
google/protobuf/struct.protogoogle.protobuf"�
Struct;
fields (2#.google.protobuf.Struct.FieldsEntryRfieldsQ
FieldsEntry
key (	Rkey,
value (2.google.protobuf.ValueRvalue:8"�
Value;

null_value (2.google.protobuf.NullValueH R	nullValue#
number_value (H RnumberValue#
string_value (	H RstringValue

bool_value (H R	boolValue<
struct_value (2.google.protobuf.StructH RstructValue;

list_value (2.google.protobuf.ListValueH R	listValueB
kind";
	ListValue.
values (2.google.protobuf.ValueRvalues*
	NullValue

NULL_VALUE B�
com.google.protobufBStructProtoPZ1github.com/golang/protobuf/ptypes/struct;structpb��GPB�Google.Protobuf.WellKnownTypesJ�
 ^
�
 2� Protocol Buffers - Google's data interchange format
 Copyright 2008 Google Inc.  All rights reserved.
 https://developers.google.com/protocol-buffers/

 Redistribution and use in source and binary forms, with or without
 modification, are permitted provided that the following conditions are
 met:

     * Redistributions of source code must retain the above copyright
 notice, this list of conditions and the following disclaimer.
     * Redistributions in binary form must reproduce the above
 copyright notice, this list of conditions and the following disclaimer
 in the documentation and/or other materials provided with the
 distribution.
     * Neither the name of Google Inc. nor the names of its
 contributors may be used to endorse or promote products derived from
 this software without specific prior written permission.

 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
 A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
 OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
 SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
 LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.


  

" ;
	
%" ;

# 
	
# 

$ H
	
$ H

% ,
	
% ,

& ,
	
& ,

' "
	

' "

( !
	
$( !
�
 2 5� `Struct` represents a structured data value, consisting of fields
 which map to dynamically typed values. In some languages, `Struct`
 might be supported by a native representation. For example, in
 scripting languages like JS a struct is represented as an
 object. The details of that representation are described together
 with the proto support for the language.

 The JSON representation for `Struct` is JSON object.



 2
9
  4 , Unordered map of dynamically typed values.


  4

  4

  4
�
= M� `Value` represents a dynamically typed value which can be either
 null, a number, a string, a boolean, a recursive struct value, or a
 list of values. A producer of value is expected to set one of that
 variants, absence of any variant indicates an error.

 The JSON representation for `Value` is JSON value.



=
"
 ?L The kind of value.


 ?
'
 A Represents a null value.


 A

 A

 A
)
C Represents a double value.


C


C

C
)
E Represents a string value.


E


E

E
*
G Represents a boolean value.


G

G	

G
-
I  Represents a structured value.


I


I

I
-
K  Represents a repeated `Value`.


K

K

K
�
 S V� `NullValue` is a singleton enumeration to represent the null value for the
 `Value` type union.

  The JSON representation for `NullValue` is JSON `null`.



 S

  U Null value.


  U

  U
�
[ ^v `ListValue` is a wrapper around a repeated field of values.

 The JSON representation for `ListValue` is JSON array.



[
:
 ]- Repeated field of dynamically typed values.


 ]


 ]

 ]

 ]bproto3
��
*protoc-gen-swagger/options/openapiv2.proto'grpc.gateway.protoc_gen_swagger.optionsgoogle/protobuf/any.protogoogle/protobuf/struct.proto"�
Swagger
swagger (	RswaggerA
info (2-.grpc.gateway.protoc_gen_swagger.options.InfoRinfo
host (	Rhost
	base_path (	RbasePathX
schemes (2>.grpc.gateway.protoc_gen_swagger.options.Swagger.SwaggerSchemeRschemes
consumes (	Rconsumes
produces (	Rproduces]
	responses
 (2?.grpc.gateway.protoc_gen_swagger.options.Swagger.ResponsesEntryR	responseso
security_definitions (2<.grpc.gateway.protoc_gen_swagger.options.SecurityDefinitionsRsecurityDefinitionsX
security (2<.grpc.gateway.protoc_gen_swagger.options.SecurityRequirementRsecurityc
external_docs (2>.grpc.gateway.protoc_gen_swagger.options.ExternalDocumentationRexternalDocs`

extensions (2@.grpc.gateway.protoc_gen_swagger.options.Swagger.ExtensionsEntryR
extensionso
ResponsesEntry
key (	RkeyG
value (21.grpc.gateway.protoc_gen_swagger.options.ResponseRvalue:8U
ExtensionsEntry
key (	Rkey,
value (2.google.protobuf.ValueRvalue:8"B
SwaggerScheme
UNKNOWN 
HTTP	
HTTPS
WS
WSSJ	J	
J"�
	Operation
tags (	Rtags
summary (	Rsummary 
description (	Rdescriptionc
external_docs (2>.grpc.gateway.protoc_gen_swagger.options.ExternalDocumentationRexternalDocs!
operation_id (	RoperationId
consumes (	Rconsumes
produces (	Rproduces_
	responses	 (2A.grpc.gateway.protoc_gen_swagger.options.Operation.ResponsesEntryR	responses
schemes
 (	Rschemes

deprecated (R
deprecatedX
security (2<.grpc.gateway.protoc_gen_swagger.options.SecurityRequirementRsecurityb

extensions (2B.grpc.gateway.protoc_gen_swagger.options.Operation.ExtensionsEntryR
extensionso
ResponsesEntry
key (	RkeyG
value (21.grpc.gateway.protoc_gen_swagger.options.ResponseRvalue:8U
ExtensionsEntry
key (	Rkey,
value (2.google.protobuf.ValueRvalue:8J	"�
Response 
description (	RdescriptionG
schema (2/.grpc.gateway.protoc_gen_swagger.options.SchemaRschema[
examples (2?.grpc.gateway.protoc_gen_swagger.options.Response.ExamplesEntryRexamplesa

extensions (2A.grpc.gateway.protoc_gen_swagger.options.Response.ExtensionsEntryR
extensions;
ExamplesEntry
key (	Rkey
value (	Rvalue:8U
ExtensionsEntry
key (	Rkey,
value (2.google.protobuf.ValueRvalue:8J"�
Info
title (	Rtitle 
description (	Rdescription(
terms_of_service (	RtermsOfServiceJ
contact (20.grpc.gateway.protoc_gen_swagger.options.ContactRcontactJ
license (20.grpc.gateway.protoc_gen_swagger.options.LicenseRlicense
version (	Rversion]

extensions (2=.grpc.gateway.protoc_gen_swagger.options.Info.ExtensionsEntryR
extensionsU
ExtensionsEntry
key (	Rkey,
value (2.google.protobuf.ValueRvalue:8"E
Contact
name (	Rname
url (	Rurl
email (	Remail"/
License
name (	Rname
url (	Rurl"K
ExternalDocumentation 
description (	Rdescription
url (	Rurl"�
SchemaT
json_schema (23.grpc.gateway.protoc_gen_swagger.options.JSONSchemaR
jsonSchema$
discriminator (	Rdiscriminator
	read_only (RreadOnlyc
external_docs (2>.grpc.gateway.protoc_gen_swagger.options.ExternalDocumentationRexternalDocs.
example (2.google.protobuf.AnyRexampleJ"�

JSONSchema
ref (	Rref
title (	Rtitle 
description (	Rdescription
default (	Rdefault
	read_only (RreadOnly
multiple_of
 (R
multipleOf
maximum (Rmaximum+
exclusive_maximum (RexclusiveMaximum
minimum (Rminimum+
exclusive_minimum (RexclusiveMinimum

max_length (R	maxLength

min_length (R	minLength
pattern (	Rpattern
	max_items (RmaxItems
	min_items (RminItems!
unique_items (RuniqueItems%
max_properties (RmaxProperties%
min_properties (RminProperties
required (	Rrequired
array" (	Rarray]
type# (2I.grpc.gateway.protoc_gen_swagger.options.JSONSchema.JSONSchemaSimpleTypesRtype"w
JSONSchemaSimpleTypes
UNKNOWN 	
ARRAY
BOOLEAN
INTEGER
NULL

NUMBER

OBJECT

STRINGJJJJ	
JJJJJJJ"J$*J*+J+."�
Tag 
description (	Rdescriptionc
external_docs (2>.grpc.gateway.protoc_gen_swagger.options.ExternalDocumentationRexternalDocsJ"�
SecurityDefinitionsf
security (2J.grpc.gateway.protoc_gen_swagger.options.SecurityDefinitions.SecurityEntryRsecurityt
SecurityEntry
key (	RkeyM
value (27.grpc.gateway.protoc_gen_swagger.options.SecuritySchemeRvalue:8"�
SecuritySchemeP
type (2<.grpc.gateway.protoc_gen_swagger.options.SecurityScheme.TypeRtype 
description (	Rdescription
name (	RnameJ
in (2:.grpc.gateway.protoc_gen_swagger.options.SecurityScheme.InRinP
flow (2<.grpc.gateway.protoc_gen_swagger.options.SecurityScheme.FlowRflow+
authorization_url (	RauthorizationUrl
	token_url (	RtokenUrlG
scopes (2/.grpc.gateway.protoc_gen_swagger.options.ScopesRscopesg

extensions	 (2G.grpc.gateway.protoc_gen_swagger.options.SecurityScheme.ExtensionsEntryR
extensionsU
ExtensionsEntry
key (	Rkey,
value (2.google.protobuf.ValueRvalue:8"K
Type
TYPE_INVALID 

TYPE_BASIC
TYPE_API_KEY
TYPE_OAUTH2"1
In

IN_INVALID 
IN_QUERY
	IN_HEADER"j
Flow
FLOW_INVALID 
FLOW_IMPLICIT
FLOW_PASSWORD
FLOW_APPLICATION
FLOW_ACCESS_CODE"�
SecurityRequirement�
security_requirement (2U.grpc.gateway.protoc_gen_swagger.options.SecurityRequirement.SecurityRequirementEntryRsecurityRequirement0
SecurityRequirementValue
scope (	Rscope�
SecurityRequirementEntry
key (	Rkeyk
value (2U.grpc.gateway.protoc_gen_swagger.options.SecurityRequirement.SecurityRequirementValueRvalue:8"�
ScopesP
scope (2:.grpc.gateway.protoc_gen_swagger.options.Scopes.ScopeEntryRscope8

ScopeEntry
key (	Rkey
value (	Rvalue:8BCZAgithub.com/grpc-ecosystem/grpc-gateway/protoc-gen-swagger/optionsJ԰
  �

  

 0

 X
	
 X
	
  #
	
 &
�
  M� `Swagger` is a representation of OpenAPI v2 specification's Swagger object.

 See: https://github.com/OAI/OpenAPI-Specification/blob/3.0.0/versions/2.0.md#swaggerObject




 
�
  � Specifies the Swagger Specification version being used. It can be
 used by the Swagger UI and other clients to interpret the API listing. The 
 value MUST be "2.0".


  

  	

  
d
 W Provides metadata about the API. The metadata can be used by the 
 clients if needed.


 

 

 
�
 � The host (name or ip) serving the API. This MUST be the host only and does 
 not include the scheme nor sub-paths. It MAY include a port. If the host is
 not included, the host serving the documentation is to be used (including
 the port). The host does not support path templating.


 

 	

 
�
 #� The base path on which the API is served, which is relative to the host. If
 it is not included, the API is served directly under the host. The value 
 MUST start with a leading slash (/). The basePath does not support path
 templating.
 Note that using `base_path` does not change the endpoint paths that are 
 generated in the resulting Swagger file. If you wish to use `base_path`
 with relatively generated Swagger paths, the `base_path` prefix must be 
 manually removed from your `google.api.http` paths and your code changed to 
 serve the API from the `base_path`.


 #

 #	

 #

  $*

  $

   %

   %

   %

  &

  &

  &

  '

  '	

  '

  (

  (

  (	


  )

  )

  )

�
 .%� The transfer protocol of the API. Values MUST be from the list: "http",
 "https", "ws", "wss". If the schemes is not included, the default scheme to
 be used is the one used to access the Swagger definition itself.


 .


 .

 . 

 .#$
�
 2� A list of MIME types the APIs can consume. This is global to all APIs but 
 can be overridden on specific API calls. Value MUST be as described under
 Mime Types.


 2


 2

 2

 2
�
 6� A list of MIME types the APIs can produce. This is global to all APIs but
 can be overridden on specific API calls. Value MUST be as described under
 Mime Types.


 6


 6

 6

 6
.
 	8" field 8 is reserved for 'paths'.


 	 8

 	 8

 	 8
�
 	;w field 9 is reserved for 'definitions', which at this time are already
 exposed as and customizable as proto messages.


 	;

 	;

 	;
�
 >'� An object to hold responses that can be used across operations. This
 property does not define global responses for all operations.


 >

 >!

 >$&
U
 @0H Security scheme definitions that can be used across the specification.


 @

 @*

 @-/
�
 	E-� A declaration of which security schemes are applied for the API as a whole.
 The list of values describes alternative security schemes that can be used 
 (that is, there is a logical OR between the security requirements). 
 Individual operations can override this definition.


 	E


 	E

 	E'

 	E*,
�
 	I� field 13 is reserved for 'tags', which are supposed to be exposed as and
 customizable as proto services. TODO(ivucica): add processing of proto
 service objects into OpenAPI v2 Tag objects.


 	I

 	I

 	I
1
 
K+$ Additional external documentation.


 
K

 
K%

 
K(*

 L5

 L$

 L%/

 L24
�
S � `Operation` is a representation of OpenAPI v2 specification's Operation object.

 See: https://github.com/OAI/OpenAPI-Specification/blob/3.0.0/versions/2.0.md#operationObject




S
�
 V� A list of tags for API documentation control. Tags can be used for logical
 grouping of operations by resources or any other qualifier.


 V


 V

 V

 V
�
Y� A short summary of what the operation does. For maximum readability in the
 swagger-ui, this field SHOULD be less than 120 characters.


Y

Y	

Y
u
\h A verbose explanation of the operation behavior. GFM syntax can be used for
 rich text representation.


\

\	

\
D
^*7 Additional external documentation for this operation.


^

^%

^()
�
c� Unique string used to identify the operation. The id MUST be unique among
 all operations described in the API. Tools and libraries MAY use the
 operationId to uniquely identify an operation, therefore, it is recommended
 to follow common programming naming conventions.


c

c	

c
�
g� A list of MIME types the operation can consume. This overrides the consumes
 definition at the Swagger Object. An empty value MAY be used to clear the
 global definition. Value MUST be as described under Mime Types.


g


g

g

g
�
k� A list of MIME types the operation can produce. This overrides the produces
 definition at the Swagger Object. An empty value MAY be used to clear the
 global definition. Value MUST be as described under Mime Types.


k


k

k

k
3
	m' field 8 is reserved for 'parameters'.


	 m

	 m

	 m
b
p&U The list of possible responses as they are returned from executing this
 operation.


p

p!

p$%
�
t� The transfer protocol for the operation. Values MUST be from the list:
 "http", "https", "ws", "wss". The value overrides the Swagger Object
 schemes definition.


t


t

t

t
�
	wy Declares this operation to be deprecated. Usage of the declared operation
 should be refrained. Default value is false.


	w

	w

	w
�

}-� A declaration of which security schemes are applied for this operation. The
 list of values describes alternative security schemes that can be used
 (that is, there is a logical OR between the security requirements). This
 definition overrides any declared top-level security. To remove a top-level
 security declaration, an empty array can be used.



}



}


}'


}*,

~5

~$

~%/

~24
�
� �� `Response` is a representation of OpenAPI v2 specification's Response object.

 See: https://github.com/OAI/OpenAPI-Specification/blob/3.0.0/versions/2.0.md#responseObject



�
{
 �m `Description` is a short description of the response.
 GFM syntax can be used for rich text representation.


 �

 �	

 �
�
�� `Schema` optionally defines the structure of the response.
 If `Schema` is not provided, it means there is no content to the response.


�

�	

�
1
	�$ field 3 is reserved for 'headers'.


	 �

	 �

	 �
�
�#� `Examples` gives per-mimetype response examples.
 See: https://github.com/OAI/OpenAPI-Specification/blob/3.0.0/versions/2.0.md#example-object


�

�

�!"

�4

�$

�%/

�23
�
� �� `Info` is a representation of OpenAPI v2 specification's Info object.

 See: https://github.com/OAI/OpenAPI-Specification/blob/3.0.0/versions/2.0.md#infoObject



�
-
 � The title of the application.


 �

 �	

 �
m
�_ A short description of the application. GFM syntax can be used for rich
 text representation.


�

�	

�
1
�# The Terms of Service for the API.


�

�	

�
<
�. The contact information for the exposed API.


�	

�


�
<
�. The license information for the exposed API.


�	

�


�
q
�c Provides the version of the application API (not to be confused
 with the specification version).


�

�	

�

�4

�$

�%/

�23
�
� �� `Contact` is a representation of OpenAPI v2 specification's Contact object.

 See: https://github.com/OAI/OpenAPI-Specification/blob/3.0.0/versions/2.0.md#contactObject



�
H
 �: The identifying name of the contact person/organization.


 �

 �	

 �
]
�O The URL pointing to the contact information. MUST be in the format of a
 URL.


�

�	

�
q
�c The email address of the contact person/organization. MUST be in the format
 of an email address.


�

�	

�
�
� �� `License` is a representation of OpenAPI v2 specification's License object.

 See: https://github.com/OAI/OpenAPI-Specification/blob/3.0.0/versions/2.0.md#licenseObject



�
2
 �$ The license name used for the API.


 �

 �	

 �
V
�H A URL to the license used for the API. MUST be in the format of a URL.


�

�	

�
�
� �� `ExternalDocumentation` is a representation of OpenAPI v2 specification's
 ExternalDocumentation object.

 See: https://github.com/OAI/OpenAPI-Specification/blob/3.0.0/versions/2.0.md#externalDocumentationObject



�
v
 �h A short description of the target documentation. GFM syntax can be used for
 rich text representation.


 �

 �	

 �
\
�N The URL for the target documentation. Value MUST be in the format
 of a URL.


�

�	

�
�
� �� `Schema` is a representation of OpenAPI v2 specification's Schema object.

 See: https://github.com/OAI/OpenAPI-Specification/blob/3.0.0/versions/2.0.md#schemaObject



�

 �

 �

 �

 �
�
�� Adds support for polymorphism. The discriminator is the schema property
 name that is used to differentiate between other schema that inherit this
 schema. The property name used MUST be defined at this schema and it MUST
 be in the required property list. When used, the value MUST be the name of
 this schema or any schema that inherits it.


�

�	

�
�
�� Relevant only for Schema "properties" definitions. Declares the property as
 "read only". This means that it MAY be sent as part of a response but MUST
 NOT be sent as part of the request. Properties marked as readOnly being
 true SHOULD NOT be in the required list of the defined schema. Default
 value is false.


�

�

�
-
	�  field 4 is reserved for 'xml'.


	 �

	 �

	 �
B
�*4 Additional external documentation for this schema.


�

�%

�()
Z
�"L A free-form property to include an example of an instance for this schema.


�

�

� !
�
� �� `JSONSchema` represents properties from JSON Schema taken, and as used, in
 the OpenAPI v2 spec.

 This includes changes made by OpenAPI v2.

 See: https://github.com/OAI/OpenAPI-Specification/blob/3.0.0/versions/2.0.md#schemaObject

 See also: https://cswr.github.io/JsonSchema/spec/basic_types/,
 https://github.com/json-schema-org/json-schema-spec/blob/master/schema.json

 TODO(ivucica): document fields


�
F
	�9 field 1 is reserved for '$id', omitted from OpenAPI v2.


	 �

	 �

	 �
J
	�= field 2 is reserved for '$schema', omitted from OpenAPI v2.


	�

	�

	�
�
 �� Ref is used to define an external reference to include in the message.
 This could be a fully qualified proto message reference, and that type must
 be imported into the protofile. If no message is identified, the Ref will
 be used verbatim in the output.
 For example:
  `ref: ".google.protobuf.Timestamp"`.


 �

 �	

 �
K
	�> field 4 is reserved for '$comment', omitted from OpenAPI v2.


	�

	�

	�
(
� The title of the schema.


�

�	

�
2
�$ A short description of the schema.


�

�	

�

�

�

�	

�

�

�

�

�
q
	�d field 9 is reserved for 'examples', which is omitted from OpenAPI v2 in
 favor of 'example' field.


	�

	�

	�

�

�

�	

�
u
�g Maximum represents an inclusive upper limit for a numeric instance. The 
 value of MUST be a number, 


�

�	

�

�

�

�

�
u
�g minimum represents an inclusive lower limit for a numeric instance. The 
 value of MUST be a number, 


�

�	

�

	�

	�

	�

	�


�


�


�	


�

�

�

�	

�

�

�

�	

�
S
	�F field 18 is reserved for 'additionalItems', omitted from OpenAPI v2.


	�

	�

	�
j
	�] field 19 is reserved for 'items', but in OpenAPI-specific way.
 TODO(ivucica): add 'items'?


	�

	�

	�

�

�

�	

�

�

�

�	

�

�

�

�

�
L
	�? field 23 is reserved for 'contains', omitted from OpenAPI v2.


	�

	�

	�

�

�

�	

�

�

�

�	

�

� 

�


�

�

�
�
	�{ field 27 is reserved for 'additionalProperties', but in OpenAPI-specific
 way. TODO(ivucica): add 'additionalProperties'?


	�

	�

	�
O
	�B field 28 is reserved for 'definitions', omitted from OpenAPI v2.


	�

	�

	�
~
	�q field 29 is reserved for 'properties', but in OpenAPI-specific way.
 TODO(ivucica): add 'additionalProperties'?


		�

		�

		�
�
	�� following fields are reserved, as the properties have been omitted from
 OpenAPI v2:
 patternProperties, dependencies, propertyNames, const


	
�

	
�

	
�
0
�" Items in 'array' must be unique.


�


�

�

�

 ��

 �

  �

  �

  �

 �

 �	

 �

 �

 �

 �

 �

 �

 �

 �

 �

 �

 �

 �


 �

 �

 �


 �

 �

 �


 �

�+

�


� 

�!%

�(*
�
	�� following fields are reserved, as the properties have been omitted from 
 OpenAPI v2: format, contentMediaType, contentEncoding, if, then, else


	�

	�

	�
j
	�] field 42 is reserved for 'allOf', but in OpenAPI-specific way.
 TODO(ivucica): add 'allOf'?


	�

	�

	�
v
	�i following fields are reserved, as the properties have been omitted from
 OpenAPI v2:
 anyOf, oneOf, not


	�

	�

	�
�
	� �� `Tag` is a representation of OpenAPI v2 specification's Tag object.

 See: https://github.com/OAI/OpenAPI-Specification/blob/3.0.0/versions/2.0.md#tagObject



	�
�
		�� field 1 is reserved for 'name'. In our generator, this is (to be) extracted
 from the name of proto service, and thus not exposed to the user, as
 changing tag object's name would break the link to the references to the
 tag in individual operation specifications.

 TODO(ivucica): Add 'name' property. Use it to allow override of the name of
 global Tag object, then use that name to reference the tag throughout the
 Swagger file.


		 �

		 �

		 �
g
	 �Y A short description for the tag. GFM syntax can be used for rich text 
 representation.


	 �

	 �	

	 �
?
	�*1 Additional external documentation for this tag.


	�

	�%

	�()
�

� �� `SecurityDefinitions` is a representation of OpenAPI v2 specification's
 Security Definitions object.

 See: https://github.com/OAI/OpenAPI-Specification/blob/3.0.0/versions/2.0.md#securityDefinitionsObject

 A declaration of the security schemes available to be used in the
 specification. This does not enforce the security schemes on the operations
 and only serves to provide the relevant details for each scheme.



�
`

 �+R A single security scheme definition, mapping a "name" to the scheme it
 defines.



 �


 �&


 �)*
�
� �� `SecurityScheme` is a representation of OpenAPI v2 specification's
 Security Scheme object.

 See: https://github.com/OAI/OpenAPI-Specification/blob/3.0.0/versions/2.0.md#securitySchemeObject

 Allows the definition of a security scheme that can be used by the
 operations. Supported schemes are basic authentication, an API key (either as
 a header or as a query parameter) and OAuth2's common flows (implicit,
 password, application and access code).


�
c
 ��S The type of the security scheme. Valid values are "basic",
 "apiKey" or "oauth2".


 �

  �

  �

  �

 �

 �

 �

 �

 �

 �

 �

 �

 �
T
��D The location of the API key. Valid values are "query" or "header".


�	

 �

 �

 �

�

�

�

�

�

�
�
��w The flow used by the OAuth2 security scheme. Valid values are
 "implicit", "password", "application" or "accessCode".


�

 �

 �

 �

�

�

�

�

�

�

�

�

�

�

�

�
a
 �S The type of the security scheme. Valid values are "basic",
 "apiKey" or "oauth2".


 �

 �

 �
8
�* A short description for security scheme.


�

�	

�
X
�J The name of the header or query parameter to be used.
 Valid for apiKey.


�

�	

�
f
�X The location of the API key. Valid values are "query" or
 "header".
 Valid for apiKey.


�

�

�

�
�� The flow used by the OAuth2 security scheme. Valid values are
 "implicit", "password", "application" or "accessCode".
 Valid for oauth2.


�

�

�
�
�� The authorization URL to be used for this flow. This SHOULD be in
 the form of a URL.
 Valid for oauth2/implicit and oauth2/accessCode.


�

�	

�
�
�� The token URL to be used for this flow. This SHOULD be in the
 form of a URL.
 Valid for oauth2/password, oauth2/application and oauth2/accessCode.


�

�	

�
W
�I The available scopes for the OAuth2 security scheme.
 Valid for oauth2.


�

�	

�

�4

�$

�%/

�23
�
� �� `SecurityRequirement` is a representation of OpenAPI v2 specification's
 Security Requirement object.

 See: https://github.com/OAI/OpenAPI-Specification/blob/3.0.0/versions/2.0.md#securityRequirementObject

 Lists the required security schemes to execute this operation. The object can
 have multiple security schemes declared in it which are all required (that
 is, there is a logical AND between the schemes).

 The name used for each property MUST correspond to a security scheme
 declared in the Security Definitions.


�
�
 ��� If the security scheme is of type "oauth2", then the value is a list of
 scope names required for the execution. For other security scheme types,
 the array MUST be empty.


 �
"

  �

  �

  �

  �

  �
�
 �A� Each name must correspond to a security scheme which is declared in
 the Security Definitions. If the security scheme is of type "oauth2",
 then the value is a list of scope names required for the execution.
 For other security scheme types, the array MUST be empty.


 �'

 �(<

 �?@
�
� �� `Scopes` is a representation of OpenAPI v2 specification's Scopes object.

 See: https://github.com/OAI/OpenAPI-Specification/blob/3.0.0/versions/2.0.md#scopesObject

 Lists the available scopes for an OAuth2 security scheme.


�
l
 � ^ Maps between a name of a scope to a short description of it (as the value
 of the property).


 �

 �

 �bproto3
�
,protoc-gen-swagger/options/annotations.proto'grpc.gateway.protoc_gen_swagger.options google/protobuf/descriptor.proto*protoc-gen-swagger/options/openapiv2.proto:|
openapiv2_swagger.google.protobuf.FileOptions� (20.grpc.gateway.protoc_gen_swagger.options.SwaggerRopenapiv2Swagger:�
openapiv2_operation.google.protobuf.MethodOptions� (22.grpc.gateway.protoc_gen_swagger.options.OperationRopenapiv2Operation:|
openapiv2_schema.google.protobuf.MessageOptions� (2/.grpc.gateway.protoc_gen_swagger.options.SchemaRopenapiv2Schema:s
openapiv2_tag.google.protobuf.ServiceOptions� (2,.grpc.gateway.protoc_gen_swagger.options.TagRopenapiv2Tag:|
openapiv2_field.google.protobuf.FieldOptions� (23.grpc.gateway.protoc_gen_swagger.options.JSONSchemaRopenapiv2FieldBCZAgithub.com/grpc-ecosystem/grpc-gateway/protoc-gen-swagger/optionsJ�
  +

  

 0

 X
	
 X
	
  *
	
 4
	
	 
�
 #� ID assigned by protobuf-global-extension-registry@google.com for grpc-gateway project.

 All IDs are the same, as assigned. It is okay that they are the same, as they extend
 different descriptor messages.



 	"


 	


 



 "
	
 
�
'� ID assigned by protobuf-global-extension-registry@google.com for grpc-gateway project.

 All IDs are the same, as assigned. It is okay that they are the same, as they extend
 different descriptor messages.



$








"&
	
 
�
!� ID assigned by protobuf-global-extension-registry@google.com for grpc-gateway project.

 All IDs are the same, as assigned. It is okay that they are the same, as they extend
 different descriptor messages.



%





	


 
	
 $
�
#� ID assigned by protobuf-global-extension-registry@google.com for grpc-gateway project.

 All IDs are the same, as assigned. It is okay that they are the same, as they extend
 different descriptor messages.



%


#


#


#
	
% +
�
*$� ID assigned by protobuf-global-extension-registry@google.com for grpc-gateway project.

 All IDs are the same, as assigned. It is okay that they are the same, as they extend
 different descriptor messages.



%#


*


*


*#bproto3
�%
apis/kms/v1/messages.protothalescpl.io.ekms.kms.v1google/protobuf/timestamp.proto,protoc-gen-swagger/options/annotations.proto"*
VersionRequest
version (	Rversion"w
VersionResponse
version (	Rversion!
runtime_name (	RruntimeName'
runtime_version (	RruntimeVersion"-
GenerateKEKRequest
kek_kid (RkekKid".
GenerateKEKResponse
kek_kid (RkekKid",
DestroyKEKRequest
kek_kid (RkekKid".
DestroyKEKResponse
success (Rsuccess"
GenerateCAKRequest
size (Rsize5
kind (2!.thalescpl.io.ekms.kms.v1.KeyKindRkind
root_ca_kid (R	rootCaKid"5
GenerateCAKResponse
root_ca_kid (R	rootCaKid"3
GenerateCARequest
root_ca_kid (R	rootCaKid"(
GenerateCAResponse
cert (Rcert",
DestroyCAKRequest
kek_kid (RkekKid".
DestroyCAKResponse
success (Rsuccess"+
DestroyCARequest
kek_kid (RkekKid"-
DestroyCAResponse
success (Rsuccess"B
SignCSRRequest
csr (Rcsr
root_ca_kid (R	rootCaKid"%
SignCSRResponse
cert (Rcert*1
KeyKind
UNKNOWN 
AES
RSA
ECCB8Z6github.com/thalescpl-io/k8s-kms-plugin/apis/kms/v1;kmsJ�
 
�	
 2�	
 * // Copyright 2020 Thales DIS CPL Inc
 * //
 * // Permission is hereby granted, free of charge, to any person obtaining
 * // a copy of this software and associated documentation files (the
 * // "Software"), to deal in the Software without restriction, including
 * // without limitation the rights to use, copy, modify, merge, publish,
 * // distribute, sublicense, and/or sell copies of the Software, and to
 * // permit persons to whom the Software is furnished to do so, subject to
 * // the following conditions:
 * //
 * // The above copyright notice and this permission notice shall be
 * // included in all copies or substantial portions of the Software.
 * //
 * // THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 * // EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
 * // MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 * // NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
 * // LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
 * // OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
 * // WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.



 !

 M
	
 M
	
  )
	
 6


   %


  

  !

  !	

  !

 "


 "

 "	

 #


 #

 #	

 $


 $

 $	


 ' *


 '
-
  )  Version of the KMS plugin API.


  )

  )	

  )


, 3


,
-
 .  Version of the KMS plugin API.


 .

 .	

 .
(
0 Name of the KMS provider.


0

0	

0
Q
2D Version of the KMS provider. The string must be semver-compatible.


2

2	

2


5 8


5
Y
 7L optional kid, otherwise will be autogenerated as a UUID.v4 in the response


 7

 7

 7


: =


:

 <	 KEK kid


 <

 <

 <


? B


?
5
 A( Required kid of KEK to find and delete


 A

 A

 A


D G


D
"
 F successful destroy?


 F

 F

 F


I P


I

 K key size in bits


 K

 K

 K
P
MC What kind of key is it... only Asymmetric kinds will be supported


M	

M


M

O Root CA Key ID


O

O

O


R U


R

 T Root CA Key ID


 T

 T

 T


W Z


W

 Y Root CA Key ID


 Y

 Y

 Y


	\ _


	\
)
	 ^ Root CA cert in PEM format


	 ^

	 ^

	 ^



a d



a
5

 c( Required kid of KEK to find and delete



 c


 c


 c


f i


f
"
 h successful destroy?


 h

 h

 h


k n


k
5
 m( Required kid of KEK to find and delete


 m

 m

 m


p s


p
"
 r successful destroy?


 r

 r

 r


u z


u
$
 w Encrypted blob of DEK


 w

 w

 w

y Root CA Key ID


y

y

y


| 


|
&
 ~ Certificate in PEM Form


 ~

 ~

 ~bproto3
�
apis/kms/v1/service.protothalescpl.io.ekms.kms.v1apis/kms/v1/messages.proto2�
KMSPluginService^
Version(.thalescpl.io.ekms.kms.v1.VersionRequest).thalescpl.io.ekms.kms.v1.VersionResponsej
GenerateCAK,.thalescpl.io.ekms.kms.v1.GenerateCAKRequest-.thalescpl.io.ekms.kms.v1.GenerateCAKResponseg

GenerateCA+.thalescpl.io.ekms.kms.v1.GenerateCARequest,.thalescpl.io.ekms.kms.v1.GenerateCAResponseg

DestroyCAK+.thalescpl.io.ekms.kms.v1.DestroyCAKRequest,.thalescpl.io.ekms.kms.v1.DestroyCAKResponsed
	DestroyCA*.thalescpl.io.ekms.kms.v1.DestroyCARequest+.thalescpl.io.ekms.kms.v1.DestroyCAResponse^
SignCSR(.thalescpl.io.ekms.kms.v1.SignCSRRequest).thalescpl.io.ekms.kms.v1.SignCSRResponsej
GenerateKEK,.thalescpl.io.ekms.kms.v1.GenerateKEKRequest-.thalescpl.io.ekms.kms.v1.GenerateKEKResponseg

DestroyKEK+.thalescpl.io.ekms.kms.v1.DestroyKEKRequest,.thalescpl.io.ekms.kms.v1.DestroyKEKResponseB8Z6github.com/thalescpl-io/k8s-kms-plugin/apis/kms/v1;kmsJ�
 0
�	
 2�	
 * // Copyright 2020 Thales DIS CPL Inc
 * //
 * // Permission is hereby granted, free of charge, to any person obtaining
 * // a copy of this software and associated documentation files (the
 * // "Software"), to deal in the Software without restriction, including
 * // without limitation the rights to use, copy, modify, merge, publish,
 * // distribute, sublicense, and/or sell copies of the Software, and to
 * // permit persons to whom the Software is furnished to do so, subject to
 * // the following conditions:
 * //
 * // The above copyright notice and this permission notice shall be
 * // included in all copies or substantial portions of the Software.
 * //
 * // THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 * // EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
 * // MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 * // NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
 * // LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
 * // OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
 * // WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.



 !

 M
	
 M
	
  $


  0


 
X
  !8K Version returns the runtime name and runtime version of the KMS provider.


  !

  !

  !'6
f
 #DY GenerateCAK returns the kid, and it's public key of a new Key Pair in the PKCS11 device


 #

 #$

 #/B
G
 %A: GenerateCA Certificate and store in in the PKCS11 device


 %

 %"

 %-?
K
 'A> DestroyCAK in the PKCS11 device... this is NON-REVERSIBLE...


 '

 '"

 '-?
J
 )>= DestroyCA in the PKCS11 device... this is NON-REVERSIBLE...


 )

 ) 

 )+<
5
 +8( SignCSR signs a CSR for the in inbound


 +

 +

 +'6
T
 -DG GenerateKEK returns the KID of the GeneratedKEK if allowed/successful


 -

 -$

 -/B
c
 /AV DestroyKEK returns a success/failure to destroy the KEK... this is NON-REVERSIBLE...


 /

 /"

 /-?bproto3