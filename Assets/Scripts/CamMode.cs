using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CamMode : MonoBehaviour
{

    [SerializeField]
    private GameObject ThirdCam;
    [SerializeField]
    private GameObject FirstCam;
    [SerializeField]
    private int camMode;

    // Update is called once per frame
    void Update()
    {
        CamSet();
    }

    void CamSet()
    {
        if(Input.GetButtonDown("CamChange"))
        {
            if(camMode == 1)
            {
                camMode = 0;
            }
            else
            {
                camMode += 1;
            }
            StartCoroutine(CameraChange());
        }
    }

    IEnumerator CameraChange()
    {
        yield return new WaitForSeconds(0.01f);
        if(camMode == 0)
        {
            ThirdCam.SetActive(true);
            FirstCam.SetActive(false);
        }
        if(camMode == 1)
        {
            FirstCam.SetActive(true);
            ThirdCam.SetActive(false);
        }
    }
}
