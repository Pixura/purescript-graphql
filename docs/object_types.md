# GraphQL Type System

## Scalar Types

Scalar types are types that consist of a single value. Therefore scalar types usually translate to a primitive value in the JSON result. PureScript GraphQL comes with all the standart scalar types defined in the GraphQL language specification: `ID`, `String`, `Int`, `Float` and `Boolean`. They are available in the `GraphQL.Types` package in all lowercase e.g. `id` or `boolean`.

Currently it is not possible to create your own custom scalars with PureScript GraphQL but this functionality will follow soon.

In our `helloWorld` query we have already made use of the string scalar type as the return type of the field:

```purescript
GraphQL.field'
  (GraphQL.nonNull GraphQL.string)
  (Just "A simple Hello World query")
  \_ _ -> pure "Hello World!"
```

In GraphQL all types are nullable by default. This is why the type of the `string` scalar function is `Scalar (Maybe String)`. To receive a non-nullable type we have to call the `nonNull` function with the type. `nonNull` not only supports scalar types but any GraphQL type.