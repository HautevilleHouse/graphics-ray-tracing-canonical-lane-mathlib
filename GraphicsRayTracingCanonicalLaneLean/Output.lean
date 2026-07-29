import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.GraphicsRayTracingCanonicalLaneLean.Sampling

namespace HautevilleHouse
namespace GraphicsRayTracingCanonicalLaneLean

structure PixelOutput where
  x : ℕ
  y : ℕ
  color : Vector3

deriving Repr, DecidableEq

structure OutputPackage (S : SamplerPackage) where
  image : List PixelOutput
  toneMapping : Vector3 → Vector3
  outputFormat : String
  imageComplete : Prop
  colorCorrect : Prop

deriving Repr, DecidableEq

structure OutputEvidence (S : SamplerPackage) (O : OutputPackage S) where
  imageCompleteClosed : O.imageComplete
  colorCorrectClosed : O.colorCorrect
  imageSizeMatches : List.length O.image = S.imageWidth * S.imageHeight

def OutputClosed (S : SamplerPackage) (O : OutputPackage S) : Prop :=
  O.imageComplete ∧ O.colorCorrect

theorem output_closed_from_evidence (S : SamplerPackage) (O : OutputPackage S)
    (E : OutputEvidence S O) : OutputClosed S O :=
  And.intro E.imageCompleteClosed E.colorCorrectClosed

end GraphicsRayTracingCanonicalLaneLean
end HautevilleHouse