# Colibri Group LDAP Proxy Packer Image

This repository hosts a Packer image defintion for the Colibri Group LDAP Proxy.  The LDAP Proxy implements [Duo Authentication Proxy](https://duo.com/docs/authproxy_reference) along with necessary configuration required for use.   

## Building LDAP Proxy Image

1.  From a command prompt, validate the image before build. 
    ```
    packer validate
    ```
1.  Run the build.  Ensure that a role that has Secrets Manager access is specified on the command-line.  
    ```
    packer build -var packer_profile='Packer_Build_Role' ldap-proxy.json
    ```
1.  If necessary, deploy the new AMI in the AWS Console or via the AWS CLI to validate functionality. 
