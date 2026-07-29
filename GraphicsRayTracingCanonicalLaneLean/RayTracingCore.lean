import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphicsRayTracingCanonicalLaneLean

structure RaytracingCorePackage where
  cameraModel : Prop
  rayGeneration : Prop
  intersectGeometry : Prop
  shadeFragment : Prop
  accumulateColor : Prop

structure RaytracingCoreEvidence (R : RaytracingCorePackage) where
  cameraModelClosed : R.cameraModel
  rayGenerationClosed : R.rayGeneration
  intersectGeometryClosed : R.intersectGeometry
  shadeFragmentClosed : R.shadeFragment
  accumulateColorClosed : R.accumulateColor

def RaytracingCoreClosed (R : RaytracingCorePackage) : Prop :=
  R.cameraModel ∧ R.rayGeneration ∧ R.intersectGeometry ∧ R.shadeFragment ∧ R.accumulateColor

theorem raytracing_core_closed_from_evidence (R : RaytracingCorePackage) (E : RaytracingCoreEvidence R) :
    RaytracingCoreClosed R := by
  exact And.intro E.cameraModelClosed
    (And.intro E.rayGenerationClosed
      (And.intro E.intersectGeometryClosed
        (And.intro E.shadeFragmentClosed E.accumulateColorClosed)))

end GraphicsRayTracingCanonicalLaneLean
end HautevilleHouse