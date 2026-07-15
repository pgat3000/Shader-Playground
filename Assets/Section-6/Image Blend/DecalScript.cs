using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[ExecuteInEditMode]
public class DecalScript : MonoBehaviour
{
    public float EveryNFrames =60;
    private  float framecounter =0;
    private  Material Mat;

    private bool ShowDecal = false;
    private static string decalToggle = "_ShowDecal";

    // Start is called before the first frame update
    void Start()
    {
        Mat = GetComponent<Renderer>().sharedMaterial;
        framecounter = 0;
    }

    private void OnMouseDown()
    {
   

    }

    // Update is called once per frame
    void Update()
    {
        framecounter += 1;
        if (framecounter > EveryNFrames)
        {
            ShowDecal = !ShowDecal;
            if (ShowDecal)
            {
                Mat.SetFloat(decalToggle, 1);
            }
            else
            {
                Mat.SetFloat(decalToggle, 0);
            }

            framecounter = 0;
        }
    }
}
