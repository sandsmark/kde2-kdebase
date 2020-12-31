set(sidebar_tree_SRCS
        konq_sidebartree.cpp
        konq_sidebartreeitem.cpp
        konq_sidebartreetoplevelitem.cpp
        konqsidebar_tree.cpp
    )

qt2_wrap_cpp(sidebar_tree_SRCS
    SOURCES
        konq_sidebartree.h
        konqsidebar_tree.h
    )

kde2_library(libkonqsidebar_tree
    SOURCES
        ${sidebar_tree_SRCS}
    LIBS
        kde2::konqsidebarplugin
    )

file(TOUCH
    ${CMAKE_CURRENT_BINARY_DIR}/konqsidebar_dummy.cpp
    )

kde2_module(libkonqsidebar_tree
    SOURCES
        ${CMAKE_CURRENT_BINARY_DIR}/konqsidebar_dummy.cpp
    LIBS
        kde2::konqsidebar_tree
    )

add_subdirectory(dirtree_module)
add_subdirectory(history_module)
add_subdirectory(bookmark_module)
add_subdirectory(init)
