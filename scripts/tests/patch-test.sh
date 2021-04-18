#!/usr/bin/env bash
CONTROLFILE='proxmox-patch-tests-control.txt'
ORIGINALFILE='proxmox-patch-tests-original.txt'
TESTFILE='proxmox-patch-tests.txt'
sed -i "s|if (data.status !== 'Active')|if (false)|g" ${TESTFILE}
sed -i 's|res === null \|\| res === undefined \|\| \!res \|\| res|REPLACEME|' ${TESTFILE}
sed -i -z "s/REPLACEME.*.data.status.toLowerCase() !== 'active'/false/" ${TESTFILE}
sed -i -z "s/REPLACEME.*data.status !== 'Active'/false/" ${TESTFILE}
sed -i -z "s/REPLACEME.*.false/false/" ${TESTFILE}

echo "Comparing ${TESTFILE} file after replacements with ${ORIGINALFILE}"
echo '===================================================='
diff -y ${TESTFILE} ${ORIGINALFILE}
echo '===================================================='

echo "Comparing ${TESTFILE} file after replacements with ${CONTROLFILE}"
echo '===================================================='
diff -y ${TESTFILE} ${CONTROLFILE}
echo '===================================================='
echo "Run the below to reset the ${TESTFILE} file after replacements with ${ORIGINALFILE}"
echo '===================================================='
echo "rm -f ${TESTFILE} && cp ${ORIGINALFILE} ${TESTFILE}"
echo '===================================================='
