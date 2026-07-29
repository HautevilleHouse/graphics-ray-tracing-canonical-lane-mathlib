import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphicsRayTracingCanonicalLaneLean

structure Ray where
  origin : Type u
  direction : Type u

def rayDirection (r : Ray) : Type u := r.direction

structure RayIntersectionPackage (r : Ray) where
  parameterization : r.direction -> Float -> Float -> Type v
  tMin : Float
  tMax : Float
  solutionExists : Prop
  closestPositiveRoot : Prop
  intersectionPoint : Type w

structure RayIntersectionEvidence {r : Ray} (R : RayIntersectionPackage r) where
  solutionExistsClosed : R.solutionExists
  closestPositiveRootClosed : R.closestPositiveRoot

def RayIntersectionClosed {r : Ray} (R : RayIntersectionPackage r) : Prop :=
  R.solutionExists ∧ R.closestPositiveRoot

theorem ray_intersection_closed_from_evidence {r : Ray} (R : RayIntersectionPackage r) (E : RayIntersectionEvidence R) : RayIntersectionClosed R := by
  exact And.intro E.solutionExistsClosed E.closestPositiveRootClosed

end GraphicsRayTracingCanonicalLaneLean
end HautevilleHouse