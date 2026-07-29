import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphicsRayTracingCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  RayTracingWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end GraphicsRayTracingCanonicalLaneLean
end HautevilleHouse