using System;
using System.Collections.Generic;
using System.Diagnostics;

namespace _3DRebdering
{
    public class Vector3
    {
        public float x;
        public float y;
        public float z;
        public float xNorm;
        public float yNorm;
        public float zNorm;
        public float length { get => (float)Math.Sqrt(x * x + y * y + z * z); }
        public float lengthQubed { get => x * x + y * y + z * z; }
        public Vector3(float X,float Y, float Z)
        {
            x = X;
            y = Y;
            z = Z;
            xNorm = x / length;
            yNorm = y / length;
            zNorm = z / length;
        }
        /// <summary>
        /// Dose the mathematical operation of a vector adition
        /// </summary>
        /// <param name="x"></param>
        /// <param name="y"></param>
        /// <returns></returns>
        public static Vector3 AddVec(Vector3 x, Vector3 y)
            => new Vector3(x.x + y.x, x.y + y.y, x.z + y.z);
        /// <summary>
        /// Adds alle the Vecotors in the array
        /// </summary>
        /// <param name="x"></param>
        /// <returns></returns>
        public static Vector3 AddVec(Vector3[] x)
        {
            Vector3 y = new Vector3(0, 0, 0);
            foreach (var item in x)
            {
                y.x += item.x;
                y.y += item.y;
                y.z += item.z;
            }
            return y;
        }
        public static Vector3 DeminVec(Vector3 x, Vector3 y)
            => new Vector3(x.x - y.x, x.y - y.y, x.z - y.z);
        public static Vector3 MultipliVec(Vector3 x, float r)
            => new Vector3(x.x * r, x.y * r, x.z * r);
        public static Vector3 MultipliNormVec(Vector3 x, float r)
            => new Vector3(x.xNorm * r, x.yNorm * r, x.zNorm * r);
        public static Vector3 KrosProd(Vector3 x,Vector3 y)
            => new Vector3(x.y * y.z - x.z * y.y, x.z * y.x - x.x * y.z, x.x * y.y - x.y * y.x);
        public static float SkalarProd(Vector3 x,Vector3 y)
            => x.x * y.x + x.y * x.y + x.z * y.z;
        public static float LengthBetwenVec(Vector3 x,Vector3 y)
            => (float)Math.Sqrt((x.x - y.x) * (x.x - y.x) + (x.y - y.y) * (x.y - y.y) + (x.z - y.z) * (x.z - y.z));
        public static float SquarLengthBetwenVec(Vector3 x, Vector3 y)
            => (x.x - y.x) * (x.x - y.x) + (x.y - y.y) * (x.y - y.y) + (x.z - y.z) * (x.z - y.z);
        /// <summary>
        /// Cheks if to Vectors are Equal in ther mathematicel sence.
        /// </summary>
        /// <param name="x"></param>
        /// <param name="y"></param>
        /// <returns></returns>
        public static bool Equals(Vector3 x,Vector3 y)
        {
            if (x.x == y.x && x.y == y.y && x.z == y.z)
                return true;
            return false;
        }
        /// <summary>
        /// Cheks if this vector and the vector 'y' are equal in ther mathematicel sence.
        /// </summary>
        /// <param name="x"></param>
        /// <returns></returns>
        public bool Equals(Vector3 vec)
        {
            if (x == vec.x && y == vec.y && z == vec.z)
                return true;
            return false;
        }
    }
    public class Ray
    {
        public Vector3 directionVec;
        public Vector3 startVec;
        public Ray(Vector3 DirectionVec, Vector3 StartVec)
        {
            directionVec = DirectionVec;
            startVec = StartVec;
        }

        public Vector3 RayPos(float x)
            => Vector3.AddVec(startVec, Vector3.MultipliVec(directionVec, x));
        public Vector3 normRayPos(float x)
            => Vector3.AddVec(startVec, Vector3.MultipliNormVec(directionVec, x));
        /// <summary>
        /// Returns the distens of a point from the Ray
        /// </summary>
        /// <param name="RayStartPoint">Start point of the Ray</param>
        /// <param name="RayVector">Direction vector</param>
        /// <param name="point">Point to wich the distenz is calculated</param>
        /// <returns>Returns the x and the dist</returns>
        public static (float,float) RayPointDist(Vector3 RayStartPoint,Vector3 RayVector,Vector3 point)
        {
            float c1 = RayStartPoint.x - point.x;
            float c2 = RayStartPoint.y - point.y;
            float c3 = RayStartPoint.z - point.z;
            float x = (-2 * RayVector.x * c1 - 2 * RayVector.y * c2 - 2 * RayVector.z * c3) / (2 * RayVector.x * RayVector.x + 2 * RayVector.y * RayVector.y + 2 * RayVector.z * RayVector.z);
            float dist = (float)Math.Sqrt((c1 + x * RayVector.x) * (c1 + x * RayVector.x) + (c2 + x * RayVector.y) * (c2 + x * RayVector.y) + (c3 + x * RayVector.z) * (c3 + x * RayVector.z));
            return (x,dist);
        }
    }
    public class Plane
    {
        public Vector3[] directionVec;
        public Vector3 startVec;
        public Vector3 NormVec;
        public Plane(Vector3[] DirectionVec, Vector3 StartVec)
        {
            directionVec = DirectionVec;
            startVec = StartVec;
            NormVec = Vector3.KrosProd(directionVec[0], directionVec[1]);
        }
        public Plane(Vector3 StartVec,Vector3 Direction1,Vector3 Direction2)
        {
            directionVec = new Vector3[] { Direction1, Direction2 };
            startVec = StartVec;
            NormVec = Vector3.KrosProd(Direction1, Direction2);
        }
        public Vector3 PlanPos(float x,float y)
            => Vector3.AddVec(new Vector3[] { startVec, Vector3.MultipliVec(directionVec[0], x), Vector3.MultipliVec(directionVec[1], y) });
        public Vector3 PlanNormPos(float x,float y)
            => new Vector3(startVec.x + x * directionVec[0].xNorm + y * directionVec[1].xNorm,
                startVec.y + x * directionVec[0].yNorm + y * directionVec[1].yNorm,
                startVec.z + x * directionVec[0].zNorm + y * directionVec[1].zNorm);
        public float MinDistToPlain(Vector3 point)
            =>(float)(Math.Abs(this.NormVec.x * (point.x - this.startVec.x) + this.NormVec.y * (point.y - this.startVec.y) + this.NormVec.z * (point.z - this.startVec.z)) / Math.Sqrt(this.NormVec.x * this.NormVec.x + this.NormVec.y * this.NormVec.y + this.NormVec.z * this.NormVec.z));
        /// <summary>
        /// returns a the bas point of the point y in the plane
        /// </summary>
        /// <param name="x"></param>
        /// <param name="y"></param>
        /// <returns></returns>
        public static Vector3 LotPointInPlan(Vector3 x,Plane y)
        {
            float dist = (float)PlanPointDist(y, x).dist;
            Vector3 PBas = Vector3.AddVec(Vector3.MultipliNormVec(y.NormVec, -dist), x);
            if ((PBas.x - y.startVec.x) * (PBas.x - y.startVec.x) + (PBas.y - y.startVec.y) * (PBas.y - y.startVec.y) + (PBas.z - y.startVec.z) * (PBas.z - y.startVec.z) > dist * dist) 
                PBas = Vector3.AddVec(Vector3.MultipliNormVec(y.NormVec, dist), x);
            return PBas;
        }
        /// <summary>
        /// returns the drawelemnt of the distens betwen a Point Y and the Plan X
        /// </summary>
        /// <param name="x"></param>
        /// <param name="y"></param>
        /// <returns></returns>
        public static DrawElement PlanPointDist(Plane x, Vector3 y)
        {
            double dist = (float)(Math.Abs(x.NormVec.x * (y.x - x.startVec.x) + x.NormVec.y * (y.y - x.startVec.y) + x.NormVec.z * (y.z - x.startVec.z)) / Math.Sqrt(x.NormVec.x * x.NormVec.x + x.NormVec.y * x.NormVec.y + x.NormVec.z * x.NormVec.z));
            return new DrawElement((float)dist, x.NormVec);
        }
        public static (Vector3, float, float) PlanPointDist(Vector3 y, Plane x)
        {
            float r = (float)PlanPointDist(x, y).dist;
            Vector3 PBas = Vector3.AddVec(Vector3.MultipliNormVec(x.NormVec, -r), y);
            if ((PBas.x - x.startVec.x) * (PBas.x - x.startVec.x) + (PBas.y - x.startVec.y) * (PBas.y - x.startVec.y) + (PBas.z - x.startVec.z) * (PBas.z - x.startVec.z) > r*r)
                PBas = Vector3.AddVec(Vector3.MultipliNormVec(x.NormVec, r), y);
            float e1 = PBas.x - x.startVec.x;
            float e2 = PBas.y - x.startVec.y;
            float e3 = PBas.z - x.startVec.z;
            float r1 = (e2 * x.directionVec[1].x - e1) / (x.directionVec[0].y * x.directionVec[1].x - x.directionVec[0].x);
            float r2 = (e3 * x.directionVec[1].y - e2) / (x.directionVec[0].z * x.directionVec[1].y - x.directionVec[0].y);
            float r3 = (e1 * x.directionVec[1].z - e3) / (x.directionVec[0].x * x.directionVec[1].z - x.directionVec[0].z);
            if (r1 != 0 && !float.IsNaN(r1))
            {
                float s = (e1 - r1 * x.directionVec[0].x) / x.directionVec[1].x;
                if (e1 == (x.directionVec[1].x * s + x.directionVec[0].x * r1) &&
                    e2 == (x.directionVec[1].y * s + x.directionVec[0].y * r1) &&
                    e3 == (x.directionVec[1].z * s + x.directionVec[0].z * r1))
                    return (PBas, s, r1);
            }
            if (r2 != 0 && !float.IsNaN(r2))
            {
                float s = (e1 - r2 * x.directionVec[0].x) / x.directionVec[1].x;
                if (e1 == (x.directionVec[1].x * s + x.directionVec[0].x * r2) &&
                    e2 == (x.directionVec[1].y * s + x.directionVec[0].y * r2) &&
                    e3 == (x.directionVec[1].z * s + x.directionVec[0].z * r2)) 
                    return (PBas, s, r2);
            }
            else
            {
                float s = (e1 - r3 * x.directionVec[0].x) / x.directionVec[1].x;
                if (e1 == (x.directionVec[1].x * s + x.directionVec[0].x * r3) &&
                    e2 == (x.directionVec[1].y * s + x.directionVec[0].y * r3) &&
                    e3 == (x.directionVec[1].z * s + x.directionVec[0].z * r3))
                    return (PBas, s, r3);
            }
            return (PBas, -1, -1);
        }
        public static DrawElement MinDistToPlains(Plane[] x,Vector3 y)
        {
            DrawElement MinDist = new DrawElement(float.PositiveInfinity, null);
            for (int z = 0; z < x.Length; z++)
            {
                DrawElement zwi = Plane.PlanPointDist(x[z], y);
                if (zwi.dist < MinDist.dist)
                    MinDist = zwi;
            }
            return MinDist;
        }
        public static Vector3 PlaneRayIntersect(Plane x, Ray y)
        {
            //Are Paralel:
            if (0 == x.NormVec.x * y.directionVec.x + x.NormVec.y * y.directionVec.y + x.NormVec.z * y.directionVec.z)
                return null;
            float dist = 0, lastZwiDist = float.NaN;
            bool wrongDir = false;
            for (int counter = 0; counter < 100000; counter++)
            {
                float zwidist =(float)PlanPointDist(x, y.normRayPos(dist)).dist;
                if (zwidist < 0.0001f)
                    return y.normRayPos(dist);
                if (lastZwiDist < zwidist && dist != 0)
                    wrongDir = true;
                if (wrongDir)
                    dist -= zwidist;
                else
                    dist += zwidist;
                lastZwiDist = zwidist;
            }
            return null;
        }
        //Halted!
        public static float[] PointInPlayn(Vector3 x,Plane plane)
        {
            Vector3 a = Vector3.DeminVec(x, plane.startVec);
            float[] counter = new float[] { 0, 0 };
            bool switcher=false;
            while (true)
            {
                float dist = Vector3.DeminVec(x, plane.PlanNormPos(counter[0], counter[1])).length;
                if (switcher)
                {
                    counter[0] += dist;
                }
                else
                    counter[1] += dist;
            }
            return null;
        }
        public bool Equals(Plane x)
            => x.directionVec == this.directionVec && x.NormVec == this.NormVec && x.startVec == this.startVec;
    }
    //Halted!
    public class Triangel
    {
        public Plane basePlane;
        public float[] border;
        public Vector3 centerPoint;
        public Vector3[] Points;
        public Vector3 AB { get => Vector3.DeminVec(Points[1], Points[0]); }
        public Vector3 AC { get => Vector3.DeminVec(Points[2], Points[0]); }
        public Vector3 BC { get => Vector3.DeminVec(Points[2], Points[1]); }
        public Triangel(Vector3[] DirectionVec, Vector3 StartVec, float[] Borders)
        {
            basePlane = new Plane(DirectionVec, StartVec);
            border = Borders;
        }
        public Triangel(Vector3 A,Vector3 B,Vector3 C)
        {
            Points = new Vector3[] { A, B, C };
            centerPoint = new Vector3((A.x + B.x + C.x) / 3, (A.y + B.y + C.y) / 3, (A.z + B.z + C.z) / 3);
            basePlane = new Plane(new Vector3[] { AC, AB }, A);
            border = new float[] { 1, 1 };
        }
        public static float TriangelPointDist2(Triangel triangel, Vector3 point)
        {
            Vector3 pointCenterVec = new Vector3(triangel.centerPoint.x - point.x, triangel.centerPoint.y - point.y, triangel.centerPoint.z - point.z);
            (Vector3 pointBasTriangel, float s, float r) = Plane.PlanPointDist(point, triangel.basePlane);
            Vector3 pointCenterVecInPlane = Vector3.DeminVec(triangel.centerPoint, pointBasTriangel);
            if ((pointCenterVec.x + pointCenterVecInPlane.x) * (pointCenterVec.x + pointCenterVecInPlane.x) + (pointCenterVec.y + pointCenterVecInPlane.y) * (pointCenterVec.y + pointCenterVecInPlane.y) +
                (pointCenterVec.z + pointCenterVecInPlane.z) * (pointCenterVec.z + pointCenterVecInPlane.z) > (pointCenterVec.x - pointCenterVecInPlane.x) * (pointCenterVec.x - pointCenterVecInPlane.x) +
                (pointCenterVec.y - pointCenterVecInPlane.y) * (pointCenterVec.y - pointCenterVecInPlane.y) + (pointCenterVec.z - pointCenterVecInPlane.z) * (pointCenterVec.z - pointCenterVecInPlane.z))
                pointCenterVecInPlane = new Vector3(-pointCenterVecInPlane.x, -pointCenterVecInPlane.y, -pointCenterVecInPlane.z);
            if (pointCenterVecInPlane.length == 0)
                return pointCenterVec.length;
            if (r <= 1 && r >= 0 && s <= 1 && s >= 0 && r + s <= 1)
                return Vector3.DeminVec(pointBasTriangel, point).length;
            //strecke AB:
            (Vector3 BorderVec, float y, float z) = rayIntersect(triangel.Points[0], triangel.centerPoint, triangel.AB, pointCenterVecInPlane);
            //strecke AC:
            if (y < 0 || z < 0 || z>1)
                (BorderVec,  y,  z) = rayIntersect(triangel.Points[0], triangel.centerPoint, triangel.AC, pointCenterVecInPlane);
            //strecke BC:
            if (y < 0 || z < 0 || z > 1)
                (BorderVec, y, z) = rayIntersect(triangel.Points[2], triangel.centerPoint, triangel.BC, pointCenterVecInPlane);
            float returner = Vector3.DeminVec(BorderVec, point).length;
            return returner;
        }
        public static DrawElement TriangelPointDistAsSquare(Triangel triangel, Vector3 point)
        {
            Vector3 pointBasTriangel = Plane.LotPointInPlan(point, triangel.basePlane);
            (float x1PBT, float dist1PBT) = Ray.RayPointDist(triangel.Points[0], triangel.AB, pointBasTriangel);
            (float x2PBT, float dist2PBT) = Ray.RayPointDist(triangel.Points[0], triangel.AC, pointBasTriangel);
            if (Inrange1and0(x1PBT) && Inrange1and0(x2PBT))
                return new DrawElement(Vector3.DeminVec(pointBasTriangel, point).length, triangel.basePlane.NormVec);
            (float x1, float dist1) = Ray.RayPointDist(triangel.Points[0], triangel.AB, point);
            (float x2, float dist2) = Ray.RayPointDist(triangel.Points[0], triangel.AC, point);
            (float x3, float dist3) = Ray.RayPointDist(triangel.Points[1], triangel.BC, point);
            bool[] zuweiser = new bool[3];
            if (x1 >= 0 && x1 <= 1)
                zuweiser[0] = true;
            else
                dist1 = float.PositiveInfinity;
            if (x2 >= 0 && x2 <= 1)
                zuweiser[1] = true;
            else
                dist2 = float.PositiveInfinity;
            if (x3 >= 0 && x3 <= 1)
                zuweiser[2] = true;
            else
                dist3 = float.PositiveInfinity;
            if (dist1 < dist2 && dist1 < dist3 && zuweiser[0])
                return new DrawElement(dist1, triangel.basePlane.NormVec);
            else if (dist2 < dist3 && zuweiser[1])
                return new DrawElement(dist2, triangel.basePlane.NormVec);
            return new DrawElement(dist3, triangel.basePlane.NormVec);
        }
        /*interesting:
        public static float TriangelPointDist(Triangel triangel, Vector3 point)
        {
            (Vector3 pointBasTriangel, float s, float r) = Plane.PlanPointDist(point, triangel.basePlane);
            (float x1PBT, float dist1PBT) = Ray.RayPointDist(triangel.Points[0], triangel.AB, pointBasTriangel);
            (float x2PBT, float dist2PBT) = Ray.RayPointDist(triangel.Points[0], triangel.AC, pointBasTriangel);
            (float x3PBT, float dist3PBT) = Ray.RayPointDist(triangel.Points[1], triangel.BC, pointBasTriangel);
            if (Inrange1and0(x1PBT) && Inrange1and0(x2PBT) && Inrange1and0(x3PBT) && (Inrange1and0(x1PBT, x2PBT) || Inrange1and0(x1PBT, x3PBT) || Inrange1and0(x3PBT, x2PBT))) 
                return Vector3.DeminVec(pointBasTriangel, point).length;
            (float x1, float dist1) = Ray.RayPointDist(triangel.Points[0], triangel.AB, point);
            (float x2, float dist2) = Ray.RayPointDist(triangel.Points[0], triangel.AC, point);
            (float x3, float dist3) = Ray.RayPointDist(triangel.Points[1], triangel.BC, point);
            bool[] zuweiser = new bool[3];
            if (x1 >= 0 && x1 <= 1)
                zuweiser[0] = true;
            else
                dist1 = float.PositiveInfinity;
            if (x2 >= 0 && x2 <= 1)
                zuweiser[1] = true;
            else
                dist2 = float.PositiveInfinity;
            if (x3 >= 0 && x3 <= 1)
                zuweiser[2] = true;
            else
                dist3 = float.PositiveInfinity;
            if (dist1 < dist2 && dist1 < dist3 && zuweiser[0])
                return dist1;
            else if (dist2 < dist3 && zuweiser[1])
                return dist2;
            return dist3;
        }*/
        //not realy working:´(
        public static DrawElement TriangelPointDist(Triangel triangel, Vector3 point)
        {
            /*
            Vector3 pointBasTriangel = Plane.LotPointInPlan(point, triangel.basePlane);
            (float x1PBT, float dist1PBT) = Ray.RayPointDist(triangel.Points[0], triangel.AB, pointBasTriangel);
            (float x2PBT, float dist2PBT) = Ray.RayPointDist(triangel.Points[0], triangel.AC, pointBasTriangel);
            (float x3PBT, float dist3PBT) = Ray.RayPointDist(triangel.Points[1], triangel.BC, pointBasTriangel);
            if (Inrange1and0(x1PBT) && Inrange1and0(x2PBT) && Inrange1and0(x1PBT, x2PBT))
                return new DrawElement(Vector3.DeminVec(pointBasTriangel, point).length, triangel.basePlane.NormVec);*/
            (float x1, float dist1) = Ray.RayPointDist(triangel.Points[0], triangel.AB, point);
            (float x2, float dist2) = Ray.RayPointDist(triangel.Points[0], triangel.AC, point);
            (float x3, float dist3) = Ray.RayPointDist(triangel.Points[1], triangel.BC, point);
            if (Inrange1and0(x1) && Inrange1and0(x2) && Inrange1and0(x1, x2))
                return new DrawElement(triangel.basePlane.MinDistToPlain(point), triangel.basePlane.NormVec);
            List<float> Dist = new List<float>();
            if (x1 >= 0 && x1 <= 1)
                Dist.Add(dist1);
            if (x2 >= 0 && x2 <= 1)
                Dist.Add(dist2);
            if (x3 >= 0 && x3 <= 1)
                Dist.Add(dist3);
            Dist.AddRange(new float[] { Vector3.LengthBetwenVec(point, triangel.Points[0]), Vector3.LengthBetwenVec(point, triangel.Points[1]), Vector3.LengthBetwenVec(point, triangel.Points[2]) });
            float MinDist = float.MaxValue;
            for (int x = 0; x < Dist.Count; x++)
                if (Dist[x] < MinDist)
                    MinDist = Dist[x];
            return new DrawElement(MinDist, triangel.basePlane.NormVec);
            /*
            else
                dist3 = float.PositiveInfinity;
            if (dist1 < dist2 && dist1 < dist3 && zuweiser[0])
                return new DrawElement(dist1, triangel.basePlane.NormVec);
            else if (dist2 < dist3 && zuweiser[1])
                return new DrawElement(dist2, triangel.basePlane.NormVec);
            return new DrawElement(dist3, triangel.basePlane.NormVec);*/
        }

        #region Methodes
        private static bool Inrange1and0(float x1PBT)
            => x1PBT <= 1 && x1PBT >= 0;
        private static bool Inrange1and0(float x1PBT, float x2PBT)
            => x1PBT + x2PBT <= 1 && x1PBT + x2PBT >= 0;
        #endregion

        public static float TriangelPointDist1(Triangel triangel, Vector3 point)
        {
            (Vector3 pointBasTriangel, float s, float r) = Plane.PlanPointDist(point, triangel.basePlane);
            if (r <= 1 && r >= 0 && s <= 1 && s >= 0 && r + s <= 1)
                return Vector3.DeminVec(pointBasTriangel, point).length;
            (float x1, float dist1) = Ray.RayPointDist(triangel.Points[0], triangel.AB, point);
            (float x2, float dist2) = Ray.RayPointDist(triangel.Points[0], triangel.AC, point);
            (float x3, float dist3) = Ray.RayPointDist(triangel.Points[1], triangel.BC, point);
            bool[] zuweiser= new bool[3];
            if (x1 >= 0 && x1 <= 1)
                zuweiser[0] = true;
            else
                dist1 = float.PositiveInfinity;
            if (x2 >= 0 && x2 <= 1)
                zuweiser[1] = true;
            else
                dist2 = float.PositiveInfinity;
            if (x3 >= 0 && x3 <= 1)
                zuweiser[2] = true;
            else
                dist3 = float.PositiveInfinity;
            if (dist1 < dist2 && dist1 < dist3 && zuweiser[0])
                return dist1;
            else if (dist2 < dist3 && zuweiser[1])
                return dist2;
            return dist3;
        }
        private static (Vector3, float,float) rayIntersect(Vector3 A1,Vector3 A2, Vector3 A1B,  Vector3 A2B)
        {
            float a1 = A2.x - A1.x;
            float a2 = A2.y - A1.y;
            float a3 = A2.z - A1.z;
            float r1 = (a2 * A1B.x - a1 * A1B.y) / (A1B.y * A2B.x - A1B.x * A2B.y);
            float r2 = (a3 * A1B.z - a1 * A1B.z) / (A1B.z * A2B.y - A1B.y * A2B.y);
            float r3 = (a1 * A1B.z - a1 * A1B.x) / (A1B.x * A2B.x - A1B.z * A2B.x);
            if (r1 != 0)
            {
                float s = (a1 + r1 * A2B.x) / A1B.x;
                if (a1 + r1 * A2B.x == s * A1B.x)
                {
                    return (Vector3.AddVec(A1, Vector3.MultipliVec(A1B, s)), r1, s);
                }
                s = (a2 + r1 * A2B.y) / A1B.y;
                if (a3 + r1 * A2B.z == s * A1B.z)
                {
                    return (Vector3.AddVec(A1, Vector3.MultipliVec(A1B, s)), r1, s);
                }
                s = (a3 + r1 * A2B.z) / A1B.z;
                if (a3 + r1 * A2B.z == s * A1B.z)
                {
                    return (Vector3.AddVec(A1, Vector3.MultipliVec(A1B, s)), r1, s);
                }
            }
            if (r2 != 0)
            {
                float s = (a1 + r2 * A2B.x) / A1B.x;
                if (a1 + r2 * A2B.x == s * A1B.x)
                {
                    return (Vector3.AddVec(A1, Vector3.MultipliVec(A1B, s)), r2, s);
                }
                s = (a2 + r2 * A2B.y) / A1B.y;
                if (a3 + r2 * A2B.z == s * A1B.z)
                {
                    return (Vector3.AddVec(A1, Vector3.MultipliVec(A1B, s)), r2, s);
                }
                s = (a3 + r2 * A2B.z) / A1B.z;
                if (a3 + r2 * A2B.z == s * A1B.z)
                {
                    return (Vector3.AddVec(A1, Vector3.MultipliVec(A1B, s)), r2, s);
                }
            }
            if (r3 != 0)
            {
                float s = (a1 + r3 * A2B.x) / A1B.x;
                if (a1 + r3 * A2B.x == s * A1B.x)
                {
                    return (Vector3.AddVec(A1, Vector3.MultipliVec(A1B, s)), r3, s);
                }
                s = (a2 + r3 * A2B.y) / A1B.y;
                if (a3 + r3 * A2B.z == s * A1B.z)
                {
                    return (Vector3.AddVec(A1, Vector3.MultipliVec(A1B, s)), r3, s);
                }
                s = (a3 + r3 * A2B.z) / A1B.z;
                if (a3 + r3 * A2B.z == s * A1B.z)
                {
                    return (Vector3.AddVec(A1, Vector3.MultipliVec(A1B, s)), r3, s);
                }
            }
            return (null,-1, -1);
        }
        private static Vector3 GetTriangelBorderVec(Triangel triangel, Vector3 pointCenterVecInPlane)
        {
            float counter1 = 0, counter2 = 0, counter3 = 0, counter4 = 0, smalestDist = float.NaN;
            bool chang = false;
            while (true)
            {
                //Calculates the distens betwen the point a+r*AB or AC and the cEnterpoint + r*pointCenterVecInPlane and the same for the point b+r*BC;
                float dist1 = Math.Abs((triangel.centerPoint.x + counter1 * pointCenterVecInPlane.xNorm - triangel.Points[0].x - counter2 * triangel.AB.xNorm) * (triangel.centerPoint.x + counter1 * pointCenterVecInPlane.xNorm - triangel.Points[0].x - counter2 * triangel.AB.xNorm) +
                    (triangel.centerPoint.y + counter1 * pointCenterVecInPlane.yNorm - triangel.Points[0].y - counter2 * triangel.AB.yNorm) * (triangel.centerPoint.y + counter1 * pointCenterVecInPlane.yNorm - triangel.Points[0].y - counter2 * triangel.AB.yNorm) +
                    (triangel.centerPoint.z + counter1 * pointCenterVecInPlane.zNorm - triangel.Points[0].z - counter2 * triangel.AB.zNorm) * (triangel.centerPoint.z + counter1 * pointCenterVecInPlane.zNorm - triangel.Points[0].z - counter2 * triangel.AB.zNorm));
                float dist2 = Math.Abs((triangel.centerPoint.x + counter1 * pointCenterVecInPlane.xNorm - triangel.Points[0].x - counter3 * triangel.AC.xNorm) * (triangel.centerPoint.x + counter1 * pointCenterVecInPlane.xNorm - triangel.Points[0].x - counter3 * triangel.AC.xNorm) +
                    (triangel.centerPoint.y + counter1 * pointCenterVecInPlane.yNorm - triangel.Points[0].y - counter3 * triangel.AC.yNorm) * (triangel.centerPoint.y + counter1 * pointCenterVecInPlane.yNorm - triangel.Points[0].y - counter3 * triangel.AC.yNorm) +
                    (triangel.centerPoint.z + counter1 * pointCenterVecInPlane.zNorm - triangel.Points[0].z - counter3 * triangel.AC.zNorm) * (triangel.centerPoint.z + counter1 * pointCenterVecInPlane.zNorm - triangel.Points[0].z - counter3 * triangel.AC.zNorm));
                float dist3 = Math.Abs((triangel.centerPoint.x + counter1 * pointCenterVecInPlane.xNorm - triangel.Points[1].x - counter4 * triangel.BC.xNorm) * (triangel.centerPoint.x + counter1 * pointCenterVecInPlane.xNorm - triangel.Points[1].x - counter4 * triangel.BC.xNorm) +
                    (triangel.centerPoint.y + counter1 * pointCenterVecInPlane.yNorm - triangel.Points[1].y - counter4 * triangel.BC.yNorm) * (triangel.centerPoint.y + counter1 * pointCenterVecInPlane.yNorm - triangel.Points[1].y - counter4 * triangel.BC.yNorm) +
                    (triangel.centerPoint.z + counter1 * pointCenterVecInPlane.zNorm - triangel.Points[1].z - counter4 * triangel.BC.zNorm) * (triangel.centerPoint.z + counter1 * pointCenterVecInPlane.zNorm - triangel.Points[1].z - counter4 * triangel.BC.zNorm));
                Debug.WriteLine("counter1: " + counter1 +" smalestDist: "+smalestDist+" change: "+chang+ "\ndist1: " + dist1 + " counter2 " + counter2 + "\ndist2: " + dist2 + " counter3 " + counter3 + "\ndist3: " + dist3+" counter4 " + counter4);
                if (dist1 < 0.001 || dist2 < 0.001 || dist3 < 0.001)
                    return new Vector3(triangel.centerPoint.x + counter1 * pointCenterVecInPlane.xNorm, triangel.centerPoint.y + counter1 * pointCenterVecInPlane.yNorm, triangel.centerPoint.z + counter1 * pointCenterVecInPlane.zNorm);
                if (smalestDist < dist1 && smalestDist < dist2 && smalestDist < dist3)
                    chang = !chang;
                if (chang)
                {
                    if (dist1 <= dist2 && dist1 <= dist3)
                    {
                        counter2 += (float)Math.Sqrt(dist1);
                        counter3 += (float)Math.Sqrt(dist1);
                        counter4 += (float)Math.Sqrt(dist1);
                        smalestDist = dist1;
                    }
                    else if (dist2 <= dist3)
                    {
                        counter2 += (float)Math.Sqrt(dist2);
                        counter3 += (float)Math.Sqrt(dist2);
                        counter4 += (float)Math.Sqrt(dist2);
                        smalestDist = dist2;
                    }
                    else
                    {
                        counter2 += (float)Math.Sqrt(dist3);
                        counter3 += (float)Math.Sqrt(dist3);
                        counter4 += (float)Math.Sqrt(dist3);
                        smalestDist = dist3;
                    }
                    continue;
                }
                if (dist1 <= dist2 && dist1 <= dist3)
                {
                    counter1 += (float)Math.Sqrt(dist1);
                    smalestDist = dist1;
                }
                else if (dist2 <= dist3)
                {
                    counter1 += (float)Math.Sqrt(dist2);
                    smalestDist = dist2;
                }
                else
                {
                    counter1 += (float)Math.Sqrt(dist3);
                    smalestDist = dist3;
                }
            }
        }
        public static DrawElement MinDistToTriangels(Triangel[] x,Vector3 y)
        {
            DrawElement MinDist = new DrawElement(float.PositiveInfinity, null);
            for (int z = 0; z < x.Length; z++)
            {
                DrawElement zwi= Triangel.TriangelPointDist(x[z], y);
                if (zwi.dist < MinDist.dist)
                    MinDist = zwi;
            }
            return MinDist;
        }
    }
    public class Qube
    {
        /// <summary>
        /// Format:
        /// A,B,C,D,E,F,G,H
        /// </summary>
        public Vector3[] Points 
        {
            get
            {
                return _Points;
            }
            set
            {
                Vertesis = new Vector3[12];
                Vertesis[0] = new Vector3(value[1].x - value[0].x, value[1].y - value[0].y, value[1].z - value[0].z);  //A->B
                Vertesis[1] = new Vector3(value[3].x - value[0].x, value[3].y - value[0].y, value[3].z - value[0].z);  //A->D
                Vertesis[2] = new Vector3(value[2].x - value[1].x, value[2].y - value[1].y, value[2].z - value[1].z);  //B->c
                Vertesis[3] = new Vector3(value[2].x - value[3].x, value[2].y - value[3].y, value[2].z - value[3].z);  //D->C
                Vertesis[4] = new Vector3(value[5].x - value[4].x, value[5].y - value[4].y, value[5].z - value[4].z);  //E->F
                Vertesis[5] = new Vector3(value[7].x - value[4].x, value[7].y - value[4].y, value[7].z - value[4].z);  //E->H
                Vertesis[6] = new Vector3(value[6].x - value[5].x, value[6].y - value[5].y, value[6].z - value[5].z);  //F->G
                Vertesis[7] = new Vector3(value[6].x - value[7].x, value[6].y - value[7].y, value[6].z - value[7].z);  //H->G
                Vertesis[8] = new Vector3(value[4].x - value[0].x, value[4].y - value[0].y, value[4].z - value[0].z);  //A->H
                Vertesis[9] = new Vector3(value[5].x - value[1].x, value[5].y - value[1].y, value[5].z - value[1].z);  //B->F
               Vertesis[10] = new Vector3(value[6].x - value[2].x, value[6].y - value[2].y, value[6].z - value[2].z);  //C->G
               Vertesis[11] = new Vector3(value[7].x - value[3].x, value[7].y - value[3].y, value[7].z - value[3].z);  //D->H
                _Points = value;
            } 
        }
        private Vector3[] _Points;
        /// <summary>
        /// Format:
        /// A->B
        /// A->D
        /// B->c
        /// D->C
        /// E->F
        /// E->H
        /// F->G
        /// H->G
        /// A->H
        /// B->F
        /// C->G
        /// D->H
        /// </summary>
        public Vector3[] Vertesis;
        public Vector3 EckPos;
        public Qube(Vector3[] vertesis,Vector3 eckPos )
        {
            Vertesis = vertesis;
            EckPos = eckPos;
        }
        public Qube(Vector3[] points)
        {
            Points = points;
        }
        public Qube(Vector3 Start,Vector3[] directions,float Length)
        {
            _Points = new Vector3[8];
            _Points[0] = Start;
            _Points[1] = Vector3.AddVec(Start, Vector3.MultipliNormVec(directions[0], Length));
            _Points[2] = Vector3.AddVec(new Vector3[] { Start, Vector3.MultipliNormVec(directions[0], Length), Vector3.MultipliNormVec(directions[1], Length) });
            _Points[3] = Vector3.AddVec(Start, Vector3.MultipliNormVec(directions[1], Length));
            _Points[4] = Vector3.AddVec(Start, Vector3.MultipliNormVec(directions[2], Length));
            _Points[5] = Vector3.AddVec(new Vector3[] { Start, Vector3.MultipliNormVec(directions[0], Length), Vector3.MultipliNormVec(directions[2], Length) });
            _Points[6] = Vector3.AddVec(new Vector3[] { Start, Vector3.MultipliNormVec(directions[0], Length), Vector3.MultipliNormVec(directions[1], Length), Vector3.MultipliNormVec(directions[2], Length) });
            _Points[7] = Vector3.AddVec(new Vector3[] { Start, Vector3.MultipliNormVec(directions[1], Length), Vector3.MultipliNormVec(directions[2], Length) });
            Points = _Points;
        }
        public static DrawElement PointDistQube(Qube qube, Vector3 point)
        {
            int[] CLosestPointIndex = new int[3] { 0, 1, 2 };
            float FursestClosestPointDist = 0;
            int Index = 0;
            for (int x = 0; x < 3; x++)
                if (Vector3.SquarLengthBetwenVec(point, qube._Points[x]) > FursestClosestPointDist)
                {
                    FursestClosestPointDist = Vector3.SquarLengthBetwenVec(point, qube._Points[x]);
                    Index = x;
                }
            for (int x = 3; x < qube._Points.Length; x++)
            {
                
                if (Vector3.SquarLengthBetwenVec(point, qube._Points[x]) < FursestClosestPointDist)
                {
                    CLosestPointIndex[Index] = x;
                    FursestClosestPointDist = 0;
                    for (int y = 0; y < 3; y++)
                        if (Vector3.SquarLengthBetwenVec(point, qube._Points[CLosestPointIndex[y]]) > FursestClosestPointDist)
                        {
                            FursestClosestPointDist = Vector3.SquarLengthBetwenVec(point, qube._Points[CLosestPointIndex[y]]);
                            Index = y;
                        }
                }
            }
            return Triangel.TriangelPointDistAsSquare(new Triangel(qube._Points[CLosestPointIndex[0]], qube._Points[CLosestPointIndex[1]], qube._Points[CLosestPointIndex[2]]), point);
        }
        public static DrawElement MinDistToQubes(Qube[] x, Vector3 y)
        {
            DrawElement MinDistQubeDrawElement = new DrawElement(float.PositiveInfinity, new Vector3(0, 0, 0));
            foreach (var item in x)
            {
                DrawElement zwi = Qube.PointDistQube(item, y);
                if (zwi.dist < MinDistQubeDrawElement.dist)
                    MinDistQubeDrawElement = zwi;
            }
            return MinDistQubeDrawElement;
        }
    }
    public class Sphear
    {
        Vector3 MidelPoint;
        float radius;
        public Sphear(Vector3 x,float y)
        {
            MidelPoint = x;
            radius = y;
        }
        public DrawElement distSphear(Vector3 point)
            => new DrawElement(Vector3.DeminVec(MidelPoint, point).length - radius, Vector3.DeminVec(MidelPoint, point));
        public static DrawElement MinDistToSpears(Sphear[] x,Vector3 y)
        {
            DrawElement MinDist = new DrawElement(float.MaxValue, null);
            for (int z = 0; z < x.Length; z++)
            {
                DrawElement zwi = x[z].distSphear(y);
                if (zwi.dist < MinDist.dist)
                    MinDist = zwi;
            }
            return MinDist;
        }

    }
    public class Mesh
    {
        public Vector3[] Points;
        public Mesh(Vector3[] points)
        {
            Points = points;
        }
        public static DrawElement PointDistMesh(Mesh Mesh, Vector3 point)
        {
            int[] CLosestPointIndex = new int[3] { 0, 1, 2 };
            float FursestClosestPointDist = 0;
            int Index = 0;
            for (int x = 0; x < 3; x++)
                if (Vector3.SquarLengthBetwenVec(point, Mesh.Points[x]) > FursestClosestPointDist)
                {
                    FursestClosestPointDist = Vector3.SquarLengthBetwenVec(point, Mesh.Points[x]);
                    Index = x;
                }
            for (int x = 3; x < Mesh.Points.Length; x++)
            {

                if (Vector3.SquarLengthBetwenVec(point, Mesh.Points[x]) < FursestClosestPointDist)
                {
                    CLosestPointIndex[Index] = x;
                    FursestClosestPointDist = 0;
                    for (int y = 0; y < 3; y++)
                        if (Vector3.SquarLengthBetwenVec(point, Mesh.Points[CLosestPointIndex[y]]) > FursestClosestPointDist)
                        {
                            FursestClosestPointDist = Vector3.SquarLengthBetwenVec(point, Mesh.Points[CLosestPointIndex[y]]);
                            Index = y;
                        }
                }
            }
            return Triangel.TriangelPointDist(new Triangel(Mesh.Points[CLosestPointIndex[0]], Mesh.Points[CLosestPointIndex[1]], Mesh.Points[CLosestPointIndex[2]]), point);
        }

    }
}
