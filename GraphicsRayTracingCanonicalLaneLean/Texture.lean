import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.GraphicsRayTracingCanonicalLaneLean.RaySceneGeometry

namespace HautevilleHouse
namespace GraphicsRayTracingCanonicalLaneLean

structure Texel where
  u : ℝ
  v : ℝ
  color : Vector3

deriving Repr, DecidableEq

structure TexturePackage where
  width : ℕ
  height : ℕ
  data : List (List Texel)
  filteringMode : String
  wrapMode : String
  samplingReady : Prop

deriving Repr, DecidableEq

structure TextureEvidence (T : TexturePackage) where
  samplingReadyClosed : T.samplingReady
  dimensionsMatch : List.length T.data = T.height ∧ (∀ row ∈ T.data, List.length row = T.width)
  texelColorInRange : ∀ row ∈ T.data, ∀ t ∈ row, 0 ≤ t.u ∧ t.u ≤ 1 ∧ 0 ≤ t.v ∧ t.v ≤ 1

def TextureClosed (T : TexturePackage) : Prop :=
  T.samplingReady ∧ (List.length T.data = T.height) ∧ (∀ row ∈ T.data, List.length row = T.width)

theorem texture_closed_from_evidence (T : TexturePackage) (E : TextureEvidence T) : TextureClosed T :=
  And.intro E.samplingReadyClosed (And.intro (by
    rcases E.dimensionsMatch with ⟨h1, h2⟩
    exact h1) (by
    rcases E.dimensionsMatch with ⟨h1, h2⟩
    exact h2))

end GraphicsRayTracingCanonicalLaneLean
end HautevilleHouse