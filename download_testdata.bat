@echo off

set downloadurl=http://downloads.webmproject.org/test_data/libvpx/
mkdir testdata

for /F "tokens=2" %%A in (source\libvpx\test\test-data.sha1) do (
echo downloading %%A
curl %downloadurl%%%A -o testdata\%%A
)