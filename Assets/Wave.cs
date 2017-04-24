using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Wave : MonoBehaviour
{
    public float TimeCounter = 0;
    private Material material;

    // Use this for initialization
    void Start()
    {

        material = this.GetComponent<MeshRenderer>().material;


    }

    // Update is called once per frame
    void Update()
    {

        TimeCounter += Time.deltaTime;

        if (TimeCounter > Mathf.PI * 2)
            TimeCounter -= Mathf.PI * 2;

        material.SetFloat("_TimeCounter", TimeCounter);
    }

}
