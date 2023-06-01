Name:           esajpip
Version:        1.0.0
Release:        1%{?dist}
Summary:        JPIP Server for serving Helioviewer data to JHelioviewer

License:        N/A
URL:            https://github.com/Helioviewer-Project/esajpip-SWHV/
Source0:        %{name}.tar

BuildRequires:  cmake gcc-c++ libgsf-devel

%description


%prep
%autosetup

mkdir build
cd build
%cmake ..
%cmake_build


%cmake_install
mkdir %{buildroot}%{_bindir}
cp /root/esajpip %{buildroot}%{_bindir}

%files
/usr/bin/esajpip
/usr/lib/esajpip-relwithdebinfo.cmake
/usr/lib/esajpip.cmake
/usr/lib/libconfig.so
/usr/lib/libconfig.so.1.0
/usr/lib/liblog4cpp.so
/usr/lib/liblog4cpp.so.1.0
/usr/server/esajpip/esajpip
/usr/server/esajpip/server.cfg

%changelog
* Thu Jun  1 2023 Daniel Garcia-Briseno
- Packaged esajpip with rpmbuild for the first time
