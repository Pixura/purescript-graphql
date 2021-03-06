module GraphQL.Execution (execute) where

import Prelude (($))

import Data.Argonaut.Core (Json)
import Data.Function.Uncurried (Fn3, runFn3)
import Effect.Aff (Aff)
import Effect.Aff.Compat (EffectFnAff, fromEffectFnAff)
import GraphQL.Document (Document)
import GraphQL.Type (Schema)

-- | Asyncroniously executes a query given the GraphQL document and a schema.
execute :: ∀ a b. Schema a b -> Document -> a -> Aff Json
execute scm document root = fromEffectFnAff $ runFn3 _execute scm document root

foreign import _execute :: ∀ a b. Fn3 (Schema a b) Document a (EffectFnAff Json)
