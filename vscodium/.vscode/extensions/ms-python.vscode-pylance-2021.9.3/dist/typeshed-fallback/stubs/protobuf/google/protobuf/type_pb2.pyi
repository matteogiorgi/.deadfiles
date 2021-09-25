"""
@generated by mypy-protobuf.  Do not edit manually!
isort:skip_file
"""
import builtins
import google.protobuf.any_pb2
import google.protobuf.descriptor
import google.protobuf.internal.containers
import google.protobuf.internal.enum_type_wrapper
import google.protobuf.message
import google.protobuf.source_context_pb2
import typing
import typing_extensions

DESCRIPTOR: google.protobuf.descriptor.FileDescriptor = ...

# The syntax in which a protocol buffer element is defined.
class Syntax(_Syntax, metaclass=_SyntaxEnumTypeWrapper):
    pass
class _Syntax:
    V = typing.NewType('V', builtins.int)
class _SyntaxEnumTypeWrapper(google.protobuf.internal.enum_type_wrapper._EnumTypeWrapper[_Syntax.V], builtins.type):
    DESCRIPTOR: google.protobuf.descriptor.EnumDescriptor = ...
    # Syntax `proto2`.
    SYNTAX_PROTO2 = Syntax.V(0)
    # Syntax `proto3`.
    SYNTAX_PROTO3 = Syntax.V(1)

# Syntax `proto2`.
SYNTAX_PROTO2 = Syntax.V(0)
# Syntax `proto3`.
SYNTAX_PROTO3 = Syntax.V(1)
global___Syntax = Syntax


# A protocol buffer message type.
class Type(google.protobuf.message.Message):
    DESCRIPTOR: google.protobuf.descriptor.Descriptor = ...
    NAME_FIELD_NUMBER: builtins.int
    FIELDS_FIELD_NUMBER: builtins.int
    ONEOFS_FIELD_NUMBER: builtins.int
    OPTIONS_FIELD_NUMBER: builtins.int
    SOURCE_CONTEXT_FIELD_NUMBER: builtins.int
    SYNTAX_FIELD_NUMBER: builtins.int
    # The fully qualified message name.
    name: typing.Text = ...
    # The list of fields.
    @property
    def fields(self) -> google.protobuf.internal.containers.RepeatedCompositeFieldContainer[global___Field]: ...
    # The list of types appearing in `oneof` definitions in this type.
    @property
    def oneofs(self) -> google.protobuf.internal.containers.RepeatedScalarFieldContainer[typing.Text]: ...
    # The protocol buffer options.
    @property
    def options(self) -> google.protobuf.internal.containers.RepeatedCompositeFieldContainer[global___Option]: ...
    # The source context.
    @property
    def source_context(self) -> google.protobuf.source_context_pb2.SourceContext: ...
    # The source syntax.
    syntax: global___Syntax.V = ...
    def __init__(self,
        *,
        name : typing.Text = ...,
        fields : typing.Optional[typing.Iterable[global___Field]] = ...,
        oneofs : typing.Optional[typing.Iterable[typing.Text]] = ...,
        options : typing.Optional[typing.Iterable[global___Option]] = ...,
        source_context : typing.Optional[google.protobuf.source_context_pb2.SourceContext] = ...,
        syntax : global___Syntax.V = ...,
        ) -> None: ...
    def HasField(self, field_name: typing_extensions.Literal[u"source_context",b"source_context"]) -> builtins.bool: ...
    def ClearField(self, field_name: typing_extensions.Literal[u"fields",b"fields",u"name",b"name",u"oneofs",b"oneofs",u"options",b"options",u"source_context",b"source_context",u"syntax",b"syntax"]) -> None: ...
global___Type = Type

# A single field of a message type.
class Field(google.protobuf.message.Message):
    DESCRIPTOR: google.protobuf.descriptor.Descriptor = ...
    # Basic field types.
    class Kind(_Kind, metaclass=_KindEnumTypeWrapper):
        pass
    class _Kind:
        V = typing.NewType('V', builtins.int)
    class _KindEnumTypeWrapper(google.protobuf.internal.enum_type_wrapper._EnumTypeWrapper[_Kind.V], builtins.type):
        DESCRIPTOR: google.protobuf.descriptor.EnumDescriptor = ...
        # Field type unknown.
        TYPE_UNKNOWN = Field.Kind.V(0)
        # Field type double.
        TYPE_DOUBLE = Field.Kind.V(1)
        # Field type float.
        TYPE_FLOAT = Field.Kind.V(2)
        # Field type int64.
        TYPE_INT64 = Field.Kind.V(3)
        # Field type uint64.
        TYPE_UINT64 = Field.Kind.V(4)
        # Field type int32.
        TYPE_INT32 = Field.Kind.V(5)
        # Field type fixed64.
        TYPE_FIXED64 = Field.Kind.V(6)
        # Field type fixed32.
        TYPE_FIXED32 = Field.Kind.V(7)
        # Field type bool.
        TYPE_BOOL = Field.Kind.V(8)
        # Field type string.
        TYPE_STRING = Field.Kind.V(9)
        # Field type group. Proto2 syntax only, and deprecated.
        TYPE_GROUP = Field.Kind.V(10)
        # Field type message.
        TYPE_MESSAGE = Field.Kind.V(11)
        # Field type bytes.
        TYPE_BYTES = Field.Kind.V(12)
        # Field type uint32.
        TYPE_UINT32 = Field.Kind.V(13)
        # Field type enum.
        TYPE_ENUM = Field.Kind.V(14)
        # Field type sfixed32.
        TYPE_SFIXED32 = Field.Kind.V(15)
        # Field type sfixed64.
        TYPE_SFIXED64 = Field.Kind.V(16)
        # Field type sint32.
        TYPE_SINT32 = Field.Kind.V(17)
        # Field type sint64.
        TYPE_SINT64 = Field.Kind.V(18)

    # Field type unknown.
    TYPE_UNKNOWN = Field.Kind.V(0)
    # Field type double.
    TYPE_DOUBLE = Field.Kind.V(1)
    # Field type float.
    TYPE_FLOAT = Field.Kind.V(2)
    # Field type int64.
    TYPE_INT64 = Field.Kind.V(3)
    # Field type uint64.
    TYPE_UINT64 = Field.Kind.V(4)
    # Field type int32.
    TYPE_INT32 = Field.Kind.V(5)
    # Field type fixed64.
    TYPE_FIXED64 = Field.Kind.V(6)
    # Field type fixed32.
    TYPE_FIXED32 = Field.Kind.V(7)
    # Field type bool.
    TYPE_BOOL = Field.Kind.V(8)
    # Field type string.
    TYPE_STRING = Field.Kind.V(9)
    # Field type group. Proto2 syntax only, and deprecated.
    TYPE_GROUP = Field.Kind.V(10)
    # Field type message.
    TYPE_MESSAGE = Field.Kind.V(11)
    # Field type bytes.
    TYPE_BYTES = Field.Kind.V(12)
    # Field type uint32.
    TYPE_UINT32 = Field.Kind.V(13)
    # Field type enum.
    TYPE_ENUM = Field.Kind.V(14)
    # Field type sfixed32.
    TYPE_SFIXED32 = Field.Kind.V(15)
    # Field type sfixed64.
    TYPE_SFIXED64 = Field.Kind.V(16)
    # Field type sint32.
    TYPE_SINT32 = Field.Kind.V(17)
    # Field type sint64.
    TYPE_SINT64 = Field.Kind.V(18)

    # Whether a field is optional, required, or repeated.
    class Cardinality(_Cardinality, metaclass=_CardinalityEnumTypeWrapper):
        pass
    class _Cardinality:
        V = typing.NewType('V', builtins.int)
    class _CardinalityEnumTypeWrapper(google.protobuf.internal.enum_type_wrapper._EnumTypeWrapper[_Cardinality.V], builtins.type):
        DESCRIPTOR: google.protobuf.descriptor.EnumDescriptor = ...
        # For fields with unknown cardinality.
        CARDINALITY_UNKNOWN = Field.Cardinality.V(0)
        # For optional fields.
        CARDINALITY_OPTIONAL = Field.Cardinality.V(1)
        # For required fields. Proto2 syntax only.
        CARDINALITY_REQUIRED = Field.Cardinality.V(2)
        # For repeated fields.
        CARDINALITY_REPEATED = Field.Cardinality.V(3)

    # For fields with unknown cardinality.
    CARDINALITY_UNKNOWN = Field.Cardinality.V(0)
    # For optional fields.
    CARDINALITY_OPTIONAL = Field.Cardinality.V(1)
    # For required fields. Proto2 syntax only.
    CARDINALITY_REQUIRED = Field.Cardinality.V(2)
    # For repeated fields.
    CARDINALITY_REPEATED = Field.Cardinality.V(3)

    KIND_FIELD_NUMBER: builtins.int
    CARDINALITY_FIELD_NUMBER: builtins.int
    NUMBER_FIELD_NUMBER: builtins.int
    NAME_FIELD_NUMBER: builtins.int
    TYPE_URL_FIELD_NUMBER: builtins.int
    ONEOF_INDEX_FIELD_NUMBER: builtins.int
    PACKED_FIELD_NUMBER: builtins.int
    OPTIONS_FIELD_NUMBER: builtins.int
    JSON_NAME_FIELD_NUMBER: builtins.int
    DEFAULT_VALUE_FIELD_NUMBER: builtins.int
    # The field type.
    kind: global___Field.Kind.V = ...
    # The field cardinality.
    cardinality: global___Field.Cardinality.V = ...
    # The field number.
    number: builtins.int = ...
    # The field name.
    name: typing.Text = ...
    # The field type URL, without the scheme, for message or enumeration
    # types. Example: `"type.googleapis.com/google.protobuf.Timestamp"`.
    type_url: typing.Text = ...
    # The index of the field type in `Type.oneofs`, for message or enumeration
    # types. The first type has index 1; zero means the type is not in the list.
    oneof_index: builtins.int = ...
    # Whether to use alternative packed wire representation.
    packed: builtins.bool = ...
    # The protocol buffer options.
    @property
    def options(self) -> google.protobuf.internal.containers.RepeatedCompositeFieldContainer[global___Option]: ...
    # The field JSON name.
    json_name: typing.Text = ...
    # The string value of the default value of this field. Proto2 syntax only.
    default_value: typing.Text = ...
    def __init__(self,
        *,
        kind : global___Field.Kind.V = ...,
        cardinality : global___Field.Cardinality.V = ...,
        number : builtins.int = ...,
        name : typing.Text = ...,
        type_url : typing.Text = ...,
        oneof_index : builtins.int = ...,
        packed : builtins.bool = ...,
        options : typing.Optional[typing.Iterable[global___Option]] = ...,
        json_name : typing.Text = ...,
        default_value : typing.Text = ...,
        ) -> None: ...
    def ClearField(self, field_name: typing_extensions.Literal[u"cardinality",b"cardinality",u"default_value",b"default_value",u"json_name",b"json_name",u"kind",b"kind",u"name",b"name",u"number",b"number",u"oneof_index",b"oneof_index",u"options",b"options",u"packed",b"packed",u"type_url",b"type_url"]) -> None: ...
global___Field = Field

# Enum type definition.
class Enum(google.protobuf.message.Message):
    DESCRIPTOR: google.protobuf.descriptor.Descriptor = ...
    NAME_FIELD_NUMBER: builtins.int
    ENUMVALUE_FIELD_NUMBER: builtins.int
    OPTIONS_FIELD_NUMBER: builtins.int
    SOURCE_CONTEXT_FIELD_NUMBER: builtins.int
    SYNTAX_FIELD_NUMBER: builtins.int
    # Enum type name.
    name: typing.Text = ...
    # Enum value definitions.
    @property
    def enumvalue(self) -> google.protobuf.internal.containers.RepeatedCompositeFieldContainer[global___EnumValue]: ...
    # Protocol buffer options.
    @property
    def options(self) -> google.protobuf.internal.containers.RepeatedCompositeFieldContainer[global___Option]: ...
    # The source context.
    @property
    def source_context(self) -> google.protobuf.source_context_pb2.SourceContext: ...
    # The source syntax.
    syntax: global___Syntax.V = ...
    def __init__(self,
        *,
        name : typing.Text = ...,
        enumvalue : typing.Optional[typing.Iterable[global___EnumValue]] = ...,
        options : typing.Optional[typing.Iterable[global___Option]] = ...,
        source_context : typing.Optional[google.protobuf.source_context_pb2.SourceContext] = ...,
        syntax : global___Syntax.V = ...,
        ) -> None: ...
    def HasField(self, field_name: typing_extensions.Literal[u"source_context",b"source_context"]) -> builtins.bool: ...
    def ClearField(self, field_name: typing_extensions.Literal[u"enumvalue",b"enumvalue",u"name",b"name",u"options",b"options",u"source_context",b"source_context",u"syntax",b"syntax"]) -> None: ...
global___Enum = Enum

# Enum value definition.
class EnumValue(google.protobuf.message.Message):
    DESCRIPTOR: google.protobuf.descriptor.Descriptor = ...
    NAME_FIELD_NUMBER: builtins.int
    NUMBER_FIELD_NUMBER: builtins.int
    OPTIONS_FIELD_NUMBER: builtins.int
    # Enum value name.
    name: typing.Text = ...
    # Enum value number.
    number: builtins.int = ...
    # Protocol buffer options.
    @property
    def options(self) -> google.protobuf.internal.containers.RepeatedCompositeFieldContainer[global___Option]: ...
    def __init__(self,
        *,
        name : typing.Text = ...,
        number : builtins.int = ...,
        options : typing.Optional[typing.Iterable[global___Option]] = ...,
        ) -> None: ...
    def ClearField(self, field_name: typing_extensions.Literal[u"name",b"name",u"number",b"number",u"options",b"options"]) -> None: ...
global___EnumValue = EnumValue

# A protocol buffer option, which can be attached to a message, field,
# enumeration, etc.
class Option(google.protobuf.message.Message):
    DESCRIPTOR: google.protobuf.descriptor.Descriptor = ...
    NAME_FIELD_NUMBER: builtins.int
    VALUE_FIELD_NUMBER: builtins.int
    # The option's name. For protobuf built-in options (options defined in
    # descriptor.proto), this is the short name. For example, `"map_entry"`.
    # For custom options, it should be the fully-qualified name. For example,
    # `"google.api.http"`.
    name: typing.Text = ...
    # The option's value packed in an Any message. If the value is a primitive,
    # the corresponding wrapper type defined in google/protobuf/wrappers.proto
    # should be used. If the value is an enum, it should be stored as an int32
    # value using the google.protobuf.Int32Value type.
    @property
    def value(self) -> google.protobuf.any_pb2.Any: ...
    def __init__(self,
        *,
        name : typing.Text = ...,
        value : typing.Optional[google.protobuf.any_pb2.Any] = ...,
        ) -> None: ...
    def HasField(self, field_name: typing_extensions.Literal[u"value",b"value"]) -> builtins.bool: ...
    def ClearField(self, field_name: typing_extensions.Literal[u"name",b"name",u"value",b"value"]) -> None: ...
global___Option = Option
