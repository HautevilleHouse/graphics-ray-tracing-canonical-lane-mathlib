import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.GraphicsRayTracingCanonicalLaneLean.RaySceneGeometry

namespace HautevilleHouse
namespace GraphicsRayTracingCanonicalLaneLean

structure BoundingBox where
  minPoint : Vector3
  maxPoint : Vector3

deriving Repr, DecidableEq

structure BvhNode where
  boundingBox : BoundingBox
  left : Option BvhNode
  right : Option BvhNode
  primitiveIndices : List ℕ

deriving Repr, DecidableEq

structure AccelerationPackage where
  scene : Scene
  tree : BvhNode
  treeBuilt : Prop
  queryTimeImprovement : Prop

deriving Repr, DecidableEq

structure AccelerationEvidence (A : AccelerationPackage) where
  treeBuiltClosed : A.treeBuilt
  queryTimeImprovementClosed : A.queryTimeImprovement
  treeCorrectness : ∀ (idx : ℕ) (h : idx ∈ A.primitiveIndices A.tree),
    (∃ (prim : Primitive), prim = A.scene.primitives.get? idx)

def AccelerationClosed (A : AccelerationPackage) : Prop :=
  A.treeBuilt ∧ A.queryTimeImprovement

theorem acceleration_closed_from_evidence (A : AccelerationPackage)
    (E : AccelerationEvidence A) : AccelerationClosed A :=
  And.intro E.treeBuiltClosed E.queryTimeImprovementClosed

end GraphicsRayTracingCanonicalLaneLean
end HautevilleHouse